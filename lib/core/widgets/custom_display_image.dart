import 'package:flutter/material.dart';

class CustomDisplayImage extends StatelessWidget {
  final String imagePath;
  const CustomDisplayImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image(
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
