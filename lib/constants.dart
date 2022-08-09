import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

// Just for demo
const productDemoImg1 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1651419144_CDEF61AD-1624-4DE6-B024-10314A4C74E8.jpeg";
const productDemoImg2 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1646380434_IMG_20220304_095131.jpg";
const productDemoImg3 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1596135713_14.jpg";
const productDemoImg4 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1611084973_%D8%B4%D9%88%D9%83%D9%88%D9%84%D8%A7_%D9%83%D9%8A%D9%83.jpg";
const productDemoImg5 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1619991040_WhatsApp_Image_2021-05-02_at_1.26.47_PM.jpeg";
const productDemoImg6 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1615466660_%D8%A8%D9%88%D9%83%D9%8A%D9%87_%D8%B4%D9%88%D9%83%D9%88%D9%84%D8%A7.jpg";
const productDemoImg7 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1612382631_%D8%B9%D9%84%D8%A8%D8%A9.jpg";
const productDemoImg8 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1595965939_7.jpg";
const productDemoImg9 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1598527689_7.jpg";

const productDemoImg11 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1618665523_66.jpg";
const productDemoImg12 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1597080188_8.jpg";
const productDemoImg13 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1596135713_14.jpg";
const productDemoImg14 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1611084973_%D8%B4%D9%88%D9%83%D9%88%D9%84%D8%A7_%D9%83%D9%8A%D9%83.jpg";
const productDemoImg15 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1619991040_WhatsApp_Image_2021-05-02_at_1.26.47_PM.jpeg";
const productDemoImg16 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1615466660_%D8%A8%D9%88%D9%83%D9%8A%D9%87_%D8%B4%D9%88%D9%83%D9%88%D9%84%D8%A7.jpg";
const productDemoImg17 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1612382631_%D8%B9%D9%84%D8%A8%D8%A9.jpg";
const productDemoImg18 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1595965939_7.jpg";
const productDemoImg19 = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/products/1598527689_7.jpg";

// End For demo

const grandisExtendedFont = "Grandis Extended";

// On color 80, 60.... those means opacity

// const Color primaryColor = Color(0xFF7B61FF);
const Color primaryColor = Color(0xFFFFBE21);
// const Color primaryColor = Colors.teal;

// const MaterialColor primaryMaterialColor =
//     MaterialColor(0xFF9581FF, <int, Color>{
//   50: Color(0xFFEFECFF),
//   100: Color(0xFFD7D0FF),
//   200: Color(0xFFBDB0FF),
//   300: Color(0xFFA390FF),
//   400: Color(0xFF8F79FF),
//   500: Color(0xFF7B61FF),
//   600: Color(0xFF7359FF),
//   700: Color(0xFF684FFF),
//   800: Color(0xFF5E45FF),
//   900: Color(0xFF6C56DD),
// });
const MaterialColor primaryMaterialColor =
    MaterialColor(0xFFFFBE21, <int, Color>{
  50: Color(0xFFFFBE21),
  100: Color(0xFFFFBE21),
  200: Color(0xFFFFBE21),
  300: Color(0xFFFFBE21),
  400: Color(0xFFFFBE21),
  500: Color(0xFFFFBE21),
  600: Color(0xFFFFBE21),
  700: Color(0xFFFFBE21),
  800: Color(0xFFFFBE21),
  900: Color(0xFFFFBE21),
});

const Color blackColor = Color(0xFF16161E);
const Color blackColor80 = Color(0xFF45454B);
const Color blackColor60 = Color(0xFF737378);
const Color blackColor40 = Color(0xFFA2A2A5);
const Color blackColor20 = Color(0xFFD0D0D2);
const Color blackColor10 = Color(0xFFE8E8E9);
const Color blackColor5 = Color(0xFFF3F3F4);

const Color whiteColor = Colors.white;
const Color whileColor80 = Color(0xFFCCCCCC);
const Color whileColor60 = Color(0xFF999999);
const Color whileColor40 = Color(0xFF666666);
const Color whileColor20 = Color(0xFF333333);
const Color whileColor10 = Color(0xFF191919);
const Color whileColor5 = Color(0xFF0D0D0D);

const Color greyColor = Color(0xFFB8B5C3);
const Color lightGreyColor = Color(0xFFF8F8F9);
const Color darkGreyColor = Color(0xFF1C1C25);
// const Color greyColor80 = Color(0xFFC6C4CF);
// const Color greyColor60 = Color(0xFFD4D3DB);
// const Color greyColor40 = Color(0xFFE3E1E7);
// const Color greyColor20 = Color(0xFFF1F0F3);
// const Color greyColor10 = Color(0xFFF8F8F9);
// const Color greyColor5 = Color(0xFFFBFBFC);

const Color purpleColor = Color(0xFF7B61FF);
const Color successColor = Color(0xFF2ED573);
const Color warningColor = Color(0xFFFFBE21);
const Color errorColor = Color(0xFFEA5B5B);

const double defaultPadding = 16.0;
const double defaultBorderRadious = 12.0;
const Duration defaultDuration = Duration(milliseconds: 300);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
]);

final emaildValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: "Enter a valid email address"),
]);

final nameValidator = MultiValidator([
  RequiredValidator(errorText: 'Full name is required')
]);

final addressTitleValidator = MultiValidator([
  RequiredValidator(errorText: 'Title is required')
]);

final addressCityValidator = MultiValidator([
  RequiredValidator(errorText: 'City is required')
]);

final addressL1Validator = MultiValidator([
  RequiredValidator(errorText: 'Address line1 is required')
]);

final addressPhone1Validator = MultiValidator([
  RequiredValidator(errorText: 'Mobile phone is required')
]);

final addressPhone2Validator = MultiValidator([
  RequiredValidator(errorText: 'Telephone is required')
]);

final numValidator = MultiValidator([
  RequiredValidator(errorText: 'Phone number is required')
]);

const pasNotMatchErrorText = "passwords do not match";
