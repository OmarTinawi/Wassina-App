import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/components/safe_back.dart';
import 'package:shop/constants.dart';
import 'package:shop/main.dart';
import 'components/login_form.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return  SafeBack(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 50),
                  child: Image.asset(
                    "assets/logo/logo.png",
                    height: 140,
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      const Text(
                        "Log in with your data that you Entered during your registration.",
                      ),
                      const SizedBox(height: defaultPadding),
                      LogInForm(formKey: _formKey),
                      Align(
                        child: TextButton(
                          child: const Text("Forgot password"),
                          onPressed: () {
                            Get.toNamed("/forget_password");
                          },
                        ),
                      ),
                      SizedBox(
                        height: _size.height > 700
                            ? _size.height * 0.07
                            : defaultPadding,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            sharedPreferences!.setInt("id", 1);
                            Get.offAllNamed("/entry_point");
                          }
                        },
                        child: const Text("Log in"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Get.offAllNamed("/sign_up");
                            },
                            child: const Text("Sign up"),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}

