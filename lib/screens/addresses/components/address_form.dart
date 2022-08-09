import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/screens/addresses/controller/addresses_controller.dart';

import '../../../constants.dart';
import '../../../models/address_model.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({Key? key, required this.formKey, this.index})
      : super(key: key);
  final GlobalKey<FormState> formKey;
  final int? index;

  @override
  Widget build(BuildContext context) {
    String? title, city, name, l1, l2, mp, tp;
    AddressesController addressesController = Get.find();
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (inputTitle) {
              title = inputTitle;
            },
            controller: index != null
                ? TextEditingController(text: addresses.elementAt(index!).title)
                : null,
            validator: addressTitleValidator,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            cursorColor: primaryColor.withOpacity(0.1),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: blackColor80,
            ),
            decoration: InputDecoration(
              hintText: "Address title",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultBorderRadious),
                  borderSide: BorderSide(color: blackColor40, width: 1)),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          TextFormField(
            controller: TextEditingController(text: "Syrian Arab Republic"),
            enabled: false,
            cursorColor: primaryColor.withOpacity(0.1),
            style: TextStyle(color: blackColor80),
            decoration: InputDecoration(
                hintText: "Country / Region",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 0.75,
                      horizontal: defaultPadding / 2),
                  child: SvgPicture.asset(
                    "assets/icons/world.svg",
                    height: 24,
                    width: 24,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.3),
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultBorderRadious),
                    borderSide: BorderSide.none),
                fillColor: blackColor10),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          TextFormField(
            controller: index != null
                ? TextEditingController(text: addresses.elementAt(index!).city)
                : null,
            onSaved: (inputCity) {
              city = inputCity;
            },
            validator: addressCityValidator,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            style: TextStyle(color: blackColor80),
            decoration: InputDecoration(
              hintText: "City",
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding * 0.75,
                    horizontal: defaultPadding / 2),
                child: SvgPicture.asset(
                  "assets/icons/city-svgrepo-com.svg",
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
          SizedBox(
            height: defaultPadding,
          ),
          TextFormField(
            controller: index != null
                ? TextEditingController(text: addresses.elementAt(index!).name)
                : null,
            onSaved: (inputName) {
              name = inputName;
            },
            validator: nameValidator,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            cursorColor: primaryColor.withOpacity(0.1),
            style: TextStyle(color: blackColor80),
            decoration: InputDecoration(
              hintText: "Full name",
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding * 0.75,
                    horizontal: defaultPadding / 2),
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
          SizedBox(
            height: defaultPadding,
          ),
          TextFormField(
            controller: index != null
                ? TextEditingController(
                    text: addresses.elementAt(index!).address1)
                : null,
            onSaved: (inputL1) {
              l1 = inputL1;
            },
            validator: addressL1Validator,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            cursorColor: primaryColor.withOpacity(0.1),
            style: TextStyle(color: blackColor80),
            decoration: InputDecoration(
              hintText: "Address line 1",
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          TextFormField(
            controller: index != null
                ? addresses.elementAt(index!).address2 == null
                    ? null
                    : TextEditingController(
                        text: addresses.elementAt(index!).address2!)
                : null,
            onSaved: (inputL2) {
              l2 = inputL2;
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            cursorColor: primaryColor.withOpacity(0.1),
            style: TextStyle(color: blackColor80),
            decoration: InputDecoration(
              hintText: "Address line 2",
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          TextFormField(
            controller: index != null
                ? TextEditingController(text: addresses.elementAt(index!).phone.substring(4))
                : null,
            onSaved: (inputMp) {
              mp = inputMp;
            },
            validator: addressPhone1Validator,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            cursorColor: primaryColor.withOpacity(0.1),
            style: TextStyle(color: blackColor80),
            decoration: InputDecoration(
              hintText: "Mobile phone",
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding * 0.75,
                    horizontal: defaultPadding / 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/phone.svg",
                      height: 24,
                      width: 24,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.3),
                    ),
                    SizedBox(
                      width: defaultPadding / 2,
                    ),
                    Text("+963"),
                    SizedBox(
                      width: defaultPadding / 2,
                    ),
                    Container(
                      height: defaultPadding * 2,
                      width: 1,
                      color: blackColor20,
                    ),
                    SizedBox(
                      width: defaultPadding / 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          TextFormField(
            controller: index != null
                ? TextEditingController(text: addresses.elementAt(index!).telephone.substring(4))
                : null,
            onSaved: (inputTp) {
              tp = inputTp;
              AddressModel tmp = AddressModel(
                  title: title!,
                  country: "Syria",
                  city: city!,
                  name: name!,
                  address1: l1!,
                  address2: l2!,
                  phone: "+963" + mp!,
                  telephone: "+961" + tp!);
              index==null?
              addressesController.addAddress(tmp):addressesController.replaceAddress(index!, tmp);
            },
            validator: addressPhone2Validator,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            cursorColor: primaryColor.withOpacity(0.1),
            style: TextStyle(color: blackColor80),
            decoration: InputDecoration(
              hintText: "Telephone",
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding * 0.75,
                    horizontal: defaultPadding / 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/telephone-svgrepo-com.svg",
                      height: 24,
                      width: 24,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.3),
                    ),
                    SizedBox(
                      width: defaultPadding / 2,
                    ),
                    Text("+963"),
                    SizedBox(
                      width: defaultPadding / 2,
                    ),
                    Container(
                      height: defaultPadding * 2,
                      width: 1,
                      color: blackColor20,
                    ),
                    SizedBox(
                      width: defaultPadding / 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
