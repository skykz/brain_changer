import 'dart:async';
import 'dart:io';
import 'package:brain_changer/common/presentation/launcher/cubit/launcher_cubit.dart';
import 'package:brain_changer/common/presentation/launcher/ui/launcher_screen.dart';
import 'package:brain_changer/di_locator/app_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    HttpOverrides.global = MyHttpOverrides();

    // await Firebase.initializeApp();

    await setupLocator();

    runApp(const MyApp());
  }, (error, StackTrace stackTrace) {
    // FirebaseCras/hlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => GlobalLauncherCubit()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: const LauncherScreen()),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
