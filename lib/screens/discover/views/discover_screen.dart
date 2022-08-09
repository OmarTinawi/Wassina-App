import 'package:flutter/material.dart';
import 'package:shop/constants.dart';
import 'package:shop/screens/discover/model/sections.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: defaultPadding/2),
          child: ListView.builder(
              itemCount: sections.length,
              itemBuilder: (context , index)=>
               sections.elementAt(index)
            ),
        ),

    );
  }
}
