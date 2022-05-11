// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:brain_changer/common/data/launcher/prefs/launcher_data_source.dart';
import 'package:brain_changer/common/data/launcher/repository/launcher_repository.dart';
import 'package:brain_changer/common/domain/launcher/usecase/launcher_usecase.dart';
import 'package:brain_changer/config/network/app_network_client.dart';
import 'package:brain_changer/config/network/repository/app_network_repository.dart';
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
}

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
}

/// для репозиторий
void _repositoryModule() {
  locator.registerFactory(() => GlobalPersonalSecureDataRepository());
}

/// для useCase
void _useCaseModule() {
  locator.registerFactory(() => GlobalLauncherActionApplicationUseCase());
}
