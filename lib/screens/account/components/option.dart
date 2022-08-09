import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class Option extends StatelessWidget {
  const Option({Key? key,required this.icon,required this.title,required this.press, this.height}) : super(key: key);
  final String icon;
  final String title;
  final VoidCallback press;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: height??25,
                ),
                SizedBox(width: defaultPadding,),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(flex: 25),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding/4),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: blackColor40,
                  ),
                )
              ],
            ),
          ),
          Container(height: 0.4,color: blackColor40,),
        ],
      ),
    );
  }
}
