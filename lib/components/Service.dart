import 'package:flutter/material.dart';

Widget buildServiceCategory(String imagePath, String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: Image.asset(imagePath),
        ),
        Text(label),
      ],
    ),
  );
}
