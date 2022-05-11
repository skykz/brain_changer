import 'package:brain_changer/config/network/repository/app_network_routes.dart';
import 'package:dio/dio.dart';

class BilimApiService {
  final Future<Dio> _httpClient;
  BilimApiService(this._httpClient);

  /// get all app notification list for current user
  Future<Response> getNotificationsList(int _offset, int _limit) async {
    final _response = await _httpClient;
    return _response.get(NetworkCallRoutes.authLogin, queryParameters: {
      'limit': _limit,
      'offset': _offset,
    });
  }
}
