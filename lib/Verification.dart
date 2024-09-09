import 'package:flutter/material.dart';
import 'package:medical_app_final_project/WelcomeScreen.dart';
import 'package:medical_app_final_project/resetpass.dart';
import 'components/customDialog.dart';
import 'components/textfield.dart';

TextEditingController verifyController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class Verify extends StatefulWidget {
  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
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
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter Verification Code',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'We have sent the verification code to your mobile number',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                buildTextFormField(
                  hintText: "Verification Code",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the verification code';
                    } else if (value.length != 5) {
                      return 'Please enter a valid verification code';
                    }
                    return null;
                  },
                  controller: verifyController,
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset('images/forgetpass.png'),
                ),
                const SizedBox(height: 20), // Added space between image and button
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Reset(),
                        ),
                      );
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    minimumSize: const Size(400, 60),
                    padding: const EdgeInsets.all(15.0),
                    textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
