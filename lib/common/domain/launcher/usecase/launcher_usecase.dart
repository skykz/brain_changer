// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:brain_changer/common/data/launcher/repository/launcher_repository.dart';
import 'package:brain_changer/di_locator/app_locator.dart';
import 'package:flutter_core/core/domain/abstract/use_case/core_use_case.dart';

/// выполняет действия при входе в приложение
class GlobalLauncherActionApplicationUseCase
    extends CoreFutureNoneParamUseCase<GlobalMakeActionInputApplicationResult> {
  final GlobalPersonalSecureDataRepository _globalPersonalSecureDataRepository;

  GlobalLauncherActionApplicationUseCase()
      : _globalPersonalSecureDataRepository = locator();

  @override
  Future<GlobalMakeActionInputApplicationResult> execute() async {
    final _accessToken = await _globalPersonalSecureDataRepository.accessToken;

    return GlobalMakeActionInputApplicationResult(accessToken: _accessToken);
  }
}

/// результат для [GlobalLauncherActionApplicationUseCase]
class GlobalMakeActionInputApplicationResult {
  final String? accessToken;

  GlobalMakeActionInputApplicationResult({this.accessToken});
}
