import 'package:flutter/material.dart';

///show this screen when client have no internet access
class AppErrorNoInternetScreen extends StatelessWidget {
  const AppErrorNoInternetScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.wifi_off_rounded, color: Colors.orange),
              Text(
                  'No internet connection or \nInternet connection is unstable',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Try later  to connect',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              SizedBox(height: 20),
              // AppCustomElevatedButton(
              //     bgColor: AppColors.appFloatingButtonColor,
              //     text: GlobalTranslateConsts.tryAgain,
              //     onPressed: () {
              //       Navigator.pushNamedAndRemoveUntil(
              //           context, AppRoutes.appOnStart, (route) => false);
              //     })
            ],
          ),
        ),
      ),
    );
  }
}
