import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../components/forget_pass_form.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPadding ),
              SvgPicture.asset(
                "assets/undraw/undraw_f_pass.svg",
                width: MediaQuery.of(context).size.width*0.9,
              ),
              const SizedBox(height: defaultPadding / 2),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password recovery",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Text(
                      "Enter your E-mail address to recover you password.",
                    ),
                    const SizedBox(height: defaultPadding),
                    ForgetForm(formKey: _formKey),
                    const SizedBox(height: defaultPadding * 2),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // to continue
                        }
                      },
                      child: const Text("next"),
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
