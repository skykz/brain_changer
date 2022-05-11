import 'package:brain_changer/common/data/launcher/prefs/launcher_data_source.dart';
import 'package:brain_changer/di_locator/app_locator.dart';

class GlobalPersonalSecureDataRepository {
  final GlobalPersonalSecureDataSource _dataSource;

  GlobalPersonalSecureDataRepository() : _dataSource = locator();

  /// получает токен пользователя
  Future<String?> get accessToken => _dataSource.accessToken;

  /// получаем refresh токен полтзователя
  Future<String?> get refreshToken => _dataSource.refreshToken;

  /// получает пароль пользователя
  Future<String?> get password => _dataSource.password;

  /// получаем пин код пользователя
  Future<String?> get pinCode => _dataSource.pinCode;

  // /// получаем флаг использует ли пользователь биометрические данные
  // Future<String> get isUseBiometric => _dataSource.isUseBiometric;

  /// записавыет токен пользователя
  void setAccessToken(String accessToken) =>
      _dataSource.setAccessToken(accessToken);

  /// удаляет токен пользователя
  void removeAccessToken() => _dataSource.removeAccessToken();

  /// записывает refresh токен пользователя
  void setRefreshToken(String refreshToken) =>
      _dataSource.setRefreshToken(refreshToken);

  /// записывает пароль пользователя
  void setPassword(String password) => _dataSource.setPassword(password);

  /// сохраняет пин код пользователя
  void savePinCode(String pinCode) => _dataSource.savePinCode(pinCode);

  /// сохраняем данные об использовании биометрических данных
  // void setUseBiometric(bool isUseBiometric) =>
  //     _dataSource.setUseBiometric(isUseBiometric);

  /// удаляет все данные связянные с пользователем
  void clearAllUserData() => _dataSource.clearAll();

  /// удаляет авторизационные токены (при логауте очищаются только токены)
  void clearTokens() => _dataSource.clearTokens();
}
