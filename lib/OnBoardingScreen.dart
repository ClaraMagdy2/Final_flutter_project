import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app_final_project/WelcomeScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'components/OnBoarding.dart';

List<OnBoarding> onboardList = [
  OnBoarding('Find your Best doctors', 'images/image1.png',
      'Now locate the best doctors around your area at total ease', 'Next'),
  OnBoarding('Schedule appointments with expert Doctors', 'images/image2.png',
      'Find experienced specialists with expert ratings and reviews and book your appointments', 'Next'),
  OnBoarding('Find the best caretaker for your family members', 'images/image3.png',
      'Find the best and most experienced nurses and caretakers with expert ratings and reviews', 'Get Started')
];

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0; // Track the current index


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${currentIndex + 1}/${onboardList.length}', // Show 1/3, 2/3, etc.
            style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen())
              );
              // Skip to the last page
              setState(() {
              });
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(onboardList[currentIndex].image), // Show image based on index
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              onboardList[currentIndex].title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              onboardList[currentIndex].body,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (currentIndex != 0)
              TextButton(
                onPressed: () {
                  if (currentIndex > 0) {
                    currentIndex--;
                  }
                  setState(() {});
                },
                child: Text(
                  'Prev',
                  style: TextStyle(color: Colors.black45, fontSize: 18),
                ),
              ),
            if (currentIndex == 0)
              SizedBox(width: 55),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: onboardList.length,
              effect:ExpandingDotsEffect(
              dotHeight:10,
              dotWidth: 12,
                activeDotColor: Colors.deepPurpleAccent,
                dotColor: Colors.black26
              ),
            ),
            TextButton(
              onPressed: () {
                if (currentIndex == onboardList.length - 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                } else {
                  currentIndex++;

                }
                setState(() {});
              },
              child: Text(
                onboardList[currentIndex].textButton,
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
