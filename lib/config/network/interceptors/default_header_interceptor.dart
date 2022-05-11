import 'package:dio/dio.dart';

class DefaultHeaderInterceptor extends InterceptorsWrapper {
  final String? deviceId;
  final String? appVersion;
  DefaultHeaderInterceptor({required this.deviceId, required this.appVersion});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['app-version'] = appVersion;
    options.headers['device-id'] = deviceId;

    super.onRequest(options, handler);
  }
}
