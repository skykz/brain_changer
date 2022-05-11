// ignore_for_file: deprecated_member_use

import 'package:brain_changer/common/data/launcher/repository/launcher_repository.dart';
import 'package:brain_changer/constants/global_prefs_constants.dart';
import 'package:brain_changer/di_locator/app_locator.dart';
import 'package:dio/dio.dart';

/// interceptor для отправки авторизационного хэдера
/// и обработки ошибок [401] и [403]
class BearerTokenInterceptor extends InterceptorsWrapper {
  final Dio dio;
  final GlobalPersonalSecureDataRepository _secureDataRepository;

  /// максимальное количесво повтори при авторизационных ошибках
  static const maxRepeatCount = 3;

  /// счетчик для повторов запроса в случае авторизационных ошибок [401] и [403]
  int _repeatCounter = 0;

  BearerTokenInterceptor(this.dio) : _secureDataRepository = locator();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _secureDataRepository.accessToken;
    options.headers[GlobalPrefConstants.authorization] =
        '${GlobalPrefConstants.bearer} $accessToken';
    // log('$accessToken');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _resetRepeatCounter();
    return handler.next(response);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.connectTimeout) {
      handler.reject(err);
    } else if (err.type == DioErrorType.receiveTimeout) {
      handler.reject(err);
    } else if (err.type == DioErrorType.cancel) {
      handler.reject(err);
    } else if (err.type == DioErrorType.other) {
      handler.reject(err);
    } else if (err.type == DioErrorType.sendTimeout) {
      handler.reject(err);
    } else if (err.response?.statusCode == 403 ||
        err.response?.statusCode == 401) {
      dio.interceptors.requestLock.lock();
      dio.interceptors.responseLock.lock();

      RequestOptions? requestOptions = err.response?.requestOptions;

      try {
        // final authResponse = await _authRepository.refreshToken();
        // final accessToken = authResponse.access;
        // _secureDataRepository.setAccessToken(accessToken);
        // requestOptions.headers[GlobalNetworkConstant.authorization] =
        //     '${GlobalNetworkConstant.bearer} $accessToken';

        dio.interceptors.requestLock.unlock();
        dio.interceptors.responseLock.unlock();

        /// обновляем счетчик если количество повторов превисило лимит
        if (_repeatCounter >= maxRepeatCount) {
          _resetRepeatCounter();
          return handler.reject(err);
        }

        _repeatCounter++;

        final Response response = await dio.fetch(requestOptions!);
        return handler.resolve(response);
      } catch (ex) {
        dio.interceptors.requestLock.unlock();
        dio.interceptors.responseLock.unlock();

        _resetRepeatCounter();
        return handler.reject(err);
      }
    } else {
      _resetRepeatCounter();
      return handler.reject(err);
    }
  }

  /// обновляет счетчик _repeatCounter
  /// необходимо обновление в случае успешного ответа от сервера
  /// или при ошибках кроме 401 и 403
  void _resetRepeatCounter() {
    _repeatCounter = 0;
  }
}
