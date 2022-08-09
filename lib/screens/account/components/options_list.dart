import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'option.dart';

class OptionList extends StatelessWidget {
  const OptionList({Key? key,required this.Options,required this.listTitle}) : super(key: key);
  final String listTitle;
  final List<Option> Options;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        listTitle,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.w700 , color: blackColor , fontSize: 17),
      ),
      const SizedBox(
        height: defaultPadding ,
      ),
      ...Options

    ]);
  }
}
