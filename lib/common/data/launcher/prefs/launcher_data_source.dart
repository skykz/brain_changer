import 'package:brain_changer/constants/global_prefs_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalPersonalSecureDataSource {
  final Future<SharedPreferences> sharedPreferences;

  GlobalPersonalSecureDataSource(this.sharedPreferences);

  /// получает токен пользователя
  Future<String?> get accessToken async {
    final prefs = await sharedPreferences;
    return prefs.getString(GlobalPrefConstants.prefAccessToken);
  }

  /// получаем refresh токен полтзователя
  Future<String?> get refreshToken async {
    final prefs = await sharedPreferences;
    return prefs.getString(GlobalPrefConstants.prefRefreshToken);
  }

  /// получает пароль пользователя
  Future<String?> get password async {
    final prefs = await sharedPreferences;
    return prefs.getString(GlobalPrefConstants.prefPassword);
  }

  /// получаем пин код пользователя
  Future<String?> get pinCode async {
    final prefs = await sharedPreferences;

    return prefs.getString(GlobalPrefConstants.prefPinCode);
  }

  // /// получаем флаг использует ли пользователь биометрические данные
  // Future<String> get isUseBiometric async {
  //   final prefs = await sharedPreferences;

  //   return prefs.getString(GlobalPrefConstant.prefUseBiometric);
  // }

  /// записавыет токен пользователя
  void setAccessToken(String accessToken) async {
    final prefs = await sharedPreferences;

    prefs.setString(GlobalPrefConstants.prefAccessToken, accessToken);
  }

  /// удаляет токен пользователя
  void removeAccessToken() async {
    final prefs = await sharedPreferences;

    prefs.remove(GlobalPrefConstants.prefAccessToken);
  }

  /// записывает refresh токен пользователя
  void setRefreshToken(String refreshToken) async {
    final prefs = await sharedPreferences;

    prefs.setString(GlobalPrefConstants.prefRefreshToken, refreshToken);
  }

  /// записывает пароль пользователя
  void setPassword(String password) async {
    final prefs = await sharedPreferences;

    prefs.setString(GlobalPrefConstants.prefPassword, password);
  }

  /// сохраняет пин код пользователя
  void savePinCode(String pinCode) async {
    final prefs = await sharedPreferences;

    prefs.setString(GlobalPrefConstants.prefPinCode, pinCode);
  }

  // /// задаем флаг для использования беометрических данных
  // void setUseBiometric(bool isUseBiometric) async {
  //   final prefs = await sharedPreferences;

  //   prefs.setString(
  //       GlobalPrefConstant.prefUseBiometric, isUseBiometric.toString());
  // }

  /// очищает все данные
  void clearAll() async {
    final prefs = await sharedPreferences;
    prefs.clear();
  }

  /// очищает access и refresh токены
  void clearTokens() async {
    final prefs = await sharedPreferences;
    prefs.remove(GlobalPrefConstants.prefAccessToken);
    prefs.remove(GlobalPrefConstants.prefRefreshToken);
  }

  /// записывает refresh токен пользователя
  // void setUstudyIntroViewedState() async {
  //   final prefs = await sharedPreferences;

  //   int _count = prefs.getInt(GlobalPrefConstant.ustudyHomeIntroViewState) ?? 0;
  //   _count = _count + 1;
  //   prefs.setInt(GlobalPrefConstant.ustudyHomeIntroViewState, _count);
  // }

  // /// получаем флаг использует ли пользователь биометрические данные
  // Future<bool> get getUstudyIntroViewedState async {
  //   final prefs = await sharedPreferences;

  //   final _res = prefs.getInt(GlobalPrefConstant.ustudyHomeIntroViewState) ?? 0;

  //   return _res >= 3;
  // }
}
