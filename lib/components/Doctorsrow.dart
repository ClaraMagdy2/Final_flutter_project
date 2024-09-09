import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildDoctorCard(
    BuildContext context, {
      required String imagePath,
      required String name,
      required String specialist,
      required double rating,
    }) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0), // Spacing between columns
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Doctor's Image
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0), // Circular image
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8.0),

        // Rating (stars)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 20,
            );
          }),
        ),

        SizedBox(height: 8.0),

        // Doctor's Name
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 4.0),

        // Doctor's Specialist
        Text(
          specialist,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
