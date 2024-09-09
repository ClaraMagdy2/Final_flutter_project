import 'package:flutter/material.dart';

Widget CustomDialog(BuildContext context, {
required String text1,
required String text2,
required String text3,
required String imagePath,
required Widget targetScreen
}) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Image.asset(imagePath),
            ),
            Text(
              text1,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
            SizedBox(height: 20),
            Text(
             text2,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => targetScreen,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                minimumSize: const Size(400, 60),
                padding: const EdgeInsets.all(15.0),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Text(text3,style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

