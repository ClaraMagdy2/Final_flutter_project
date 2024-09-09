import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app_final_project/LoginScreen.dart';

import 'SignUpScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Image.asset('images/doctor.png'),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) =>LoginScreen(text1: '',text2: '',text4: '',text3: '',),
                      ),);
                    }, // Action when pressed
                    child: const Text('Log In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),

                      ),
                     minimumSize: Size(150, 60)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),);
                    }, // Action when pressed
                    child: const Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),

                        ),
                        minimumSize: Size(150, 60)
                  ),
                  ),
                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
