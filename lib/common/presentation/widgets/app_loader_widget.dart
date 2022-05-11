import 'dart:io';

import 'package:brain_changer/config/style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    Key? key,
    this.color = Colors.white,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppPngImages.brainLogo, height: 100),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
                height: 22,
                width: 22,
                child: Platform.isIOS
                    ? CupertinoActivityIndicator(radius: 14, color: color)
                    : const CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
