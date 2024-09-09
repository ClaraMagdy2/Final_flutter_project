import 'package:flutter/material.dart';
import 'package:medical_app_final_project/HomeScreenTab.dart';

import 'components/Doctors.dart';
import 'components/customDialog.dart';

class DoctorDetailScreen extends StatefulWidget {
  final Doctors doctor;
  const DoctorDetailScreen({super.key, required this.doctor,});

  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  String? selectedDay;
  String? selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.doctor.imagePath),
                radius: 80,
              ),
              SizedBox(height: 16),
              Text(
                widget.doctor.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.doctor.specialty,
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                'Rating: ${widget.doctor.rating}',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple, // Border color
                    width: 2.0,        // Border width
                    style: BorderStyle.solid, // Border style
                  ),
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
             child: Text(
                widget.doctor.description,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),
                textAlign: TextAlign.center,
                             ),),
              SizedBox(height: 16),


              // Hardcoded Date selection row
              Text('Select Date'),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 buildDateContainer("22", "Tuesday"),
                 buildDateContainer("23", "Wednesday"),
                 buildDateContainer("24", "Thursday"),
                ],
              ),
              SizedBox(height: 16),

              // Hardcoded Time selection row
              Text('Select Time'),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildTimeContainer("9:00 AM"),
                  buildTimeContainer("10:00 AM"),
                  buildTimeContainer("11:00 AM"),
                ],
              ),

              SizedBox(height: 16),
        ElevatedButton(
            onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      context,
                      text1: 'Booking Successful',
                      text2: widget.doctor.name +"will message you" ,
                      text3: 'Done',
                      imagePath: 'images/book.png',
                      targetScreen:DoctorDetailScreen(doctor:widget.doctor,) ,
                    );
                  },
                );

            },
                  child: Text('Book Appointment',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  minimumSize: const Size(400, 60),
                  padding: const EdgeInsets.all(15.0),
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),)


              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle sending a message
                },

                child: Text('Send Message'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(400, 60),
                    padding: const EdgeInsets.all(15.0),
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.deepPurple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),)
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create date container
  Widget buildDateContainer(String day, String weekday) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDay = day;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selectedDay == day ? Colors.deepPurpleAccent : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedDay == day ? Colors.deepPurple : Colors.grey,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: selectedDay == day ? Colors.white : Colors.black,
              ),
            ),
            Text(
              weekday,
              style: TextStyle(
                fontSize: 16,
                color: selectedDay == day ? Colors.white : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create time container
  Widget buildTimeContainer(String time) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeSlot = time;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedTimeSlot == time ? Colors.deepPurpleAccent : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedTimeSlot == time ? Colors.deepPurple : Colors.grey,
            width: 2,
          ),
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: selectedTimeSlot == time ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
