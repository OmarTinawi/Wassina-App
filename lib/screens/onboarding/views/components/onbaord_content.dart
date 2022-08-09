import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent(
      {Key? key,
        required this.image,
        required this.tittle,
        required this.description})
      : super(key: key);

  final String image, tittle, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 300,
        ),
        const Spacer(),
        Text(
          tittle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}