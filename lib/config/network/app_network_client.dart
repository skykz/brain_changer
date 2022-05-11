// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';
import 'package:brain_changer/config/network/interceptors/auth_bearer_token_interceptor.dart';
import 'package:brain_changer/config/network/interceptors/default_header_interceptor.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_core/core/data/abstract/network/response_body_printer_interceptor.dart';
import 'package:package_info/package_info.dart';

Future<Dio> createAuthorizedHttpClient(String baseUrl) async {
  Dio dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = 80000;
  dio.options.receiveTimeout = 50000;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? _uniqueDeviceId;
  if (Platform.isAndroid) {
    AndroidDeviceInfo _androidInfo = await deviceInfo.androidInfo;
    _uniqueDeviceId = _androidInfo.androidId;
  } else {
    IosDeviceInfo _iosInfo = await deviceInfo.iosInfo;
    _uniqueDeviceId = _iosInfo.identifierForVendor;
  }
  final _appInfo = await PackageInfo.fromPlatform();
  final _appVersion = _appInfo.version;

  dio.interceptors
    ..add(LogInterceptor(requestBody: true))
    ..add(ResponseBodyPrinterInterceptor())
    ..add(DefaultHeaderInterceptor(
        deviceId: _uniqueDeviceId, appVersion: _appVersion))
    ..add(BearerTokenInterceptor(dio));

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  return dio;
}
