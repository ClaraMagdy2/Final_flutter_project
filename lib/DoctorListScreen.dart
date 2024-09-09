import 'package:flutter/material.dart';
import 'package:medical_app_final_project/components/Doctors.dart';

import 'DoctorDetailScreen.dart';
class DoctorListScreen extends StatelessWidget {
  final List<Doctors> doctors;

  const DoctorListScreen({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Doctors'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorDetailScreen(doctor: doctor),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.deepPurple[50], // Background color
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(doctor.imagePath),
                      radius: 40, // Image size
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          doctor.specialty,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Distance: 3 km', // Example distance, replace with actual data
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.yellow[700]),
                        Text(
                          doctor.rating.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
