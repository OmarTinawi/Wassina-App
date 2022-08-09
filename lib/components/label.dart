import 'package:flutter/material.dart';

import '../constants.dart';

class Label extends StatelessWidget {
  const Label({Key? key,required this.color,required this.tittle}) : super(key: key);
  final Color color;
  final String tittle;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadious/2),
          color: color
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          tittle,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13,color: Colors.white),
        ),
      ),
    );
  }
}
