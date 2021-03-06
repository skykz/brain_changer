import 'package:brain_changer/common/presentation/widgets/app_hide_keyboard_widget.dart';
import 'package:brain_changer/config/style/app_style.dart';
import 'package:flutter/material.dart';

class AuthLoginNewUserScreen extends StatelessWidget {
  const AuthLoginNewUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppHideKeyBoardWidget(
      child: Scaffold(
        backgroundColor: AppColors.appPrimaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.appPrimaryColor,
          automaticallyImplyLeading: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Image.asset(AppPngImages.brainLogo, height: 100),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: '8 Digit program code',
                      labelText: '8 Digit program code',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.appYellowColor, width: 2.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelStyle: const TextStyle(color: Colors.grey),
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.mail_outline_rounded,
                        color: AppColors.appYellowColor,
                      ),
                      suffixStyle:
                          const TextStyle(color: AppColors.appYellowColor)),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(15)),
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.appYellowColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                        child: const Text(
                          "CONTINUE",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
