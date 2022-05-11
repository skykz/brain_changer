// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:brain_changer/common/presentation/launcher/cubit/launcher_cubit.dart';
import 'package:brain_changer/common/presentation/launcher/cubit/launcher_state.dart';
import 'package:brain_changer/common/presentation/widgets/app_loader_widget.dart';
import 'package:brain_changer/feature/presentation/auth/ui/auth_login_screen.dart';
import 'package:brain_changer/feature/presentation/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/core/presentation/abstract/bloc/core_bloc_builder.dart';
import 'package:flutter_core/core/presentation/abstract/bloc/core_state.dart';
import 'package:provider/provider.dart';

/// Страница для запуска приложения
/// в зависимости от состояния какую страницу нужно открыть при старте приложения
class LauncherScreen extends StatefulWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  _LauncherScreenState createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await context.read<GlobalLauncherCubit>().checkInitialState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      CoreUpgradeBlocBuilder<GlobalLauncherCubit, CoreState>(
        buildWhen: (prevState, curState) =>
            curState is GlobalLauncherShowLoginState ||
            curState is GlobalLauncherShowHomeState,
        builder: (context, state) {
          if (state is GlobalLauncherShowLoginState) {
            return const AuthLoginScreen();
          }
          if (state is GlobalLauncherShowHomeState) {
            return const HomeMainScreen();
          }

          return const Scaffold(body: Center(child: LoaderWidget()));
        },
      );
}
