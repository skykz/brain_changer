// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:brain_changer/common/domain/launcher/usecase/launcher_usecase.dart';
import 'package:brain_changer/common/presentation/launcher/cubit/launcher_state.dart';
import 'package:brain_changer/di_locator/app_locator.dart';
import 'package:flutter_core/core/presentation/abstract/bloc/core_cubit.dart';

class GlobalLauncherCubit extends CoreCubit {
  GlobalLauncherCubit()
      : _globalLauncherActionApplicationUseCase = locator(),
        super(null);

  final GlobalLauncherActionApplicationUseCase
      _globalLauncherActionApplicationUseCase;

  Future<void> checkInitialState() async {
    final _result = await _globalLauncherActionApplicationUseCase.execute();
    if (_result.accessToken != null) {
      emit(GlobalLauncherShowHomeState());
      return;
    } else {
      emit(GlobalLauncherShowLoginState());
      return;
    }
  }
}
