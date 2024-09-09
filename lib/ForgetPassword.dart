import 'package:flutter/material.dart';
import 'package:medical_app_final_project/Verification.dart';

import 'components/textfield.dart';
TextEditingController emailController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
class ForgetPass extends StatefulWidget {
  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
    Navigator.pop(context);
    })
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forget Password',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20), // Added spacing between texts
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Added padding for better readability
                  child: Text(
                    'Select which contact details should we use to reset your password',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),),
                  buildTextFormField(
                    prefix: Icon(Icons.email,color: Colors.black45,),
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    controller: emailController,
                  ),
                Container(
                  width: double.infinity,
                  child: Image.asset('images/forgetpass.png'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Verify(),
                        ),);
          
                    }
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
