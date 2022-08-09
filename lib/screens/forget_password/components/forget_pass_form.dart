import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class ForgetForm extends StatelessWidget {
  const ForgetForm({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
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
    );
  }
}
