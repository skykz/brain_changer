// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:brain_changer/common/data/launcher/prefs/launcher_data_source.dart';
import 'package:brain_changer/common/data/launcher/repository/launcher_repository.dart';
import 'package:brain_changer/constants/global_network_constants.dart';
import 'package:brain_changer/constants/global_prefs_constants.dart';
import 'package:flutter_core/core/di/core_locator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  coreModule();
  _commonMainModule();
  _apiServiceModule();
  _dataSourceModule();
  _repositoryModule();
  _useCaseModule();
}

void _commonMainModule() {
  // locator.registerSingletonAsync(() => createHttpClient(BuildTypeValue.url));

  /// для авторизованной зоны
  locator.registerSingletonAsync(
      () => createAuthorizedHttpClient(GlobalAPIConstants.baseUrl),
      instanceName: GlobalPrefConstants.authorized);

  /// Shared preferences
  final sharedPreferences = SharedPreferences.getInstance();
  locator.registerSingletonAsync(() => sharedPreferences);

  // /// Firebase Analytics
  // _googleAnalyticsService();
}

// void _googleAnalyticsService() {
//   locator.registerLazySingleton(() => AnalyticsService());
// }

void _apiServiceModule() async {
  /// для авторизованной зоны
  locator.registerSingleton(BilimApiService(
    locator.getAsync(instanceName: GlobalPrefConstants.authorized),
  ));
}

/// для локального хранения данных
void _dataSourceModule() async {
  final sharedPreferences = SharedPreferences.getInstance();

  locator.registerSingleton(GlobalPersonalSecureDataSource(sharedPreferences));
  locator.registerSingleton(GlobalLauncherDataSource(locator.getAsync()));
}

/// для репозиторий
void _repositoryModule() {
  ///платежи
  locator.registerFactory(() => GlobalPersonalSecureDataRepository());
  locator.registerFactory(() => GlobalLauncherRepository());
}

/// для useCase
void _useCaseModule() {
  locator.registerFactory(() => GetNotificationListUseCase());
}
