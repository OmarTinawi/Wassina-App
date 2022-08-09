import 'package:flutter/material.dart';

import '../../../../constants.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key , this.isActive = false}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 18 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive ? warningColor : warningColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12)
      ),
    );
  }
}
