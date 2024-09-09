import 'package:flutter/material.dart';

import 'DoctorListScreen.dart';
import 'components/Doctorsrow.dart';
import 'components/Service.dart';
import 'components/doctors2.dart';

class HomeScreenTab extends StatelessWidget {
  final String text;

  const HomeScreenTab({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Keep Taking Care of Your Health',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Service Category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildServiceCategory('images/doctors.png', 'Doctor'),
              buildServiceCategory('images/medical.png', 'Nurse'),
              buildServiceCategory('images/medicine.png', 'Drugs'),
              buildServiceCategory('images/checkup.png', 'Caregiver'),
            ],
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Doctors',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>DoctorListScreen(doctors: doctors),
                  ),
                );
              },
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildDoctorCard(
                  context,
                  imagePath: 'images/doctor1.jpg',
                  name: 'Dr. John Doe',
                  specialist: 'Cardiologist',
                  rating: 4.5,
                ),
                buildDoctorCard(
                  context,
                  imagePath: 'images/doctor2.jpg',
                  name: 'Dr. Jane Smith',
                  specialist: 'Neurologist',
                  rating: 4.0,
                ),
                buildDoctorCard(
                  context,
                  imagePath: 'images/doctor3.jpg',
                  name: 'Dr. Mark Taylor',
                  specialist: 'Dentist',
                  rating: 4.8,
                ),
                buildDoctorCard(context,
                  imagePath: 'images/doctor4.jpg',
                  name: 'Dr. Sara Taylor',
                  specialist: 'Heart surgeon',
                  rating: 4.8,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}