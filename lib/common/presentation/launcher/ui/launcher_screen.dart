// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:brain_changer/common/presentation/launcher/cubit/launcher_cubit.dart';
import 'package:brain_changer/common/presentation/widgets/app_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/core/presentation/abstract/bloc/core_bloc_builder.dart';
import 'package:flutter_core/core/presentation/abstract/bloc/core_state.dart';

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
      // await context.read<GlobalLauncherCubit>().checkLaunchState();
      // await context.read<GlobalLauncherCubit>().initRemoteConfig();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      CoreUpgradeBlocBuilder<GlobalLauncherCubit, CoreState>(
        // buildWhen: (prevState, curState) =>
        //     curState is GlobalLauncherShowOnboardingState ||
        //     curState is GlobalLauncherShowAppLangSelectIntroState ||
        //     curState is GlobalLauncherShowIndexPageState ||
        //     curState is GlobalAccessAppState,
        builder: (context, state) {
          // if (state is GlobalAccessAppState) {
          //   return const TechServiceScreen();
          // }
          // if (state is GlobalLauncherShowOnboardingState) {
          //   return const AppIntroScreen();
          // }
          // if (state is GlobalLauncherShowAppLangSelectIntroState) {
          //   return const AppIntroLocaleScreen();
          // }
          // if (state is GlobalLauncherShowIndexPageState) {
          //   if (state.accessToken != null) {
          //     return ChangeNotifierProvider<UserData>(
          //         create: (_) => UserData(state.accessToken),
          //         child: const IndexScreen());
          //   }
          //   return const AuthLoginScreen();
          // }
          return const Scaffold(body: Center(child: LoaderWidget()));
        },
      );
}
