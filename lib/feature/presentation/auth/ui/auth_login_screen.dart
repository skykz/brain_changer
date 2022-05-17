import 'package:brain_changer/common/presentation/widgets/app_hide_keyboard_widget.dart';
import 'package:brain_changer/config/style/app_style.dart';
import 'package:brain_changer/feature/presentation/auth/ui/auth_forgot_screen.dart';
import 'package:brain_changer/feature/presentation/auth/ui/auth_new_user_screen.dart';
import 'package:flutter/material.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({Key? key}) : super(key: key);

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  bool _isHidePassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppHideKeyBoardWidget(
      child: Scaffold(
        backgroundColor: AppColors.appPrimaryColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(AppPngImages.brainLogo, height: 100),
                  ),
                  TextField(
                    decoration: InputDecoration(
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
                        hintText: 'Username',
                        labelText: 'Username',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: AppColors.appYellowColor,
                        ),
                        suffixStyle:
                            const TextStyle(color: AppColors.appYellowColor)),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    obscureText: _isHidePassword,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.appYellowColor, width: 2.0),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: 'Password',
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: AppColors.appYellowColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isHidePassword =
                                    _isHidePassword ? false : true;
                              });
                            },
                            icon: Icon(
                              _isHidePassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: Colors.white,
                            )),
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
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
                            "LOGIN",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AuthLoginNewUserScreen()));
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 2,
                                        color: Colors.white,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                          child: const Text(
                            "NEW USER",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.appYellowColor, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(15)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 4, color: Colors.white),
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            child: const Text(
                              "FORGOT PASSWORD",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AuthLoginForgotScreen()));
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(15)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 4, color: Colors.white),
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            child: const Text(
                              "FORGOT USERNAME",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
