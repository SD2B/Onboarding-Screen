import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  OnboardContent({
    super.key,
    this.image,
    this.title,
    this.description,
  });
  String? image;
  String? title;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          title!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          description!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Image.asset(image!),
        const Spacer(),
      ],
    );
  }
}
