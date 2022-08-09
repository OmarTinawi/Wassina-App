import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/components/safe_back.dart';
import 'package:shop/screens/auth/views/components/sign_up_form.dart';

import '../../../components/check_box.dart';
import '../../../constants.dart';
import 'components/login_form.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeBack(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's get started!",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Text(
                      "Please enter your valid data in order to create an account.",
                    ),
                    const SizedBox(height: defaultPadding),
                    SignUpForm(formKey: _formKey),
                    const SizedBox(height: defaultPadding),
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          CheckBox(size: 17,),
                          Text("I agree with the "),
                          InkWell(
                            splashColor: primaryColor.withOpacity(0.1),
                            onTap: (){
                              print("ok");
                            },
                            child: Text("Terms of services " , style: TextStyle(
                              color: primaryColor
                            ),),
                          ),
                          Text("& privacy policy")
                        ],
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
                          // Navigator.pushNamedAndRemoveUntil(
                          //     context,
                          //     entryPointScreenRoute,
                          //     ModalRoute.withName(logInScreenRoute));
                        }
                      },
                      child: const Text("Sign Up"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do you have an account?"),
                        TextButton(
                          onPressed: () {
                            Get.offAllNamed("/login");
                          },
                          child: const Text("Log in"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
