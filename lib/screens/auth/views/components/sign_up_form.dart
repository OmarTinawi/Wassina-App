import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key,required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [TextFormField(
          onSaved: (fname) {
            // Email
          },
          validator: nameValidator,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          cursorColor: primaryColor.withOpacity(0.1),
          decoration: InputDecoration(
            hintText: "Full name",
            prefixIcon: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
              child: SvgPicture.asset(
                "assets/icons/Profile.svg",
                height: 24,
                width: 24,
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.3),
              ),
            ),
          ),
        ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            onSaved: (emal) {
              // Email
            },
            validator: emaildValidator,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            cursorColor: primaryColor.withOpacity(0.1),
            decoration: InputDecoration(
              hintText: "Email address",
              prefixIcon: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Message.svg",
                  height: 24,
                  width: 24,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.3),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            onSaved: (pass) {
              // Password
            },
            validator: passwordValidator,
            textInputAction: TextInputAction.next,
            cursorColor: primaryColor.withOpacity(0.1),
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Lock.svg",
                  height: 24,
                  width: 24,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.3),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            onSaved: (phone) {
              // Password
            },
            validator: numValidator,
            keyboardType: TextInputType.number,
            cursorColor: primaryColor.withOpacity(0.1),
            decoration: InputDecoration(
              hintText: "Phone number",
              prefixIcon: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/phone.svg",
                  height: 24,
                  width: 24,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
