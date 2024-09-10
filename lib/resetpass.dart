import 'package:flutter/material.dart';
import 'package:medical_app_final_project/WelcomeScreen.dart';
import 'components/customDialog.dart';
import 'components/textfield.dart';

bool isObscure = true;
GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController passwordController1 = TextEditingController();
TextEditingController passwordController2 = TextEditingController();
class Reset extends StatefulWidget {
  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
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
                  'Enter New Password',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Please enter your new password',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                buildTextFormField(
                  prefix: Icon(Icons.lock, color: Colors.black45),
                  hintText: "Confirm new Password",
                  keyboardType: TextInputType.text,
                  obscureText: isObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 6) {
                      return "Please enter at least 6 characters";
                    }
                    return null;
                  },
                  controller: passwordController1,  // Initialized with widget.text2
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                buildTextFormField(
                  prefix: Icon(Icons.lock, color: Colors.black45),
                  hintText: "Password",
                  keyboardType: TextInputType.text,
                  obscureText: isObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 6) {
                      return "Please enter at least 6 characters";
                    }
                    return null;
                  },
                  controller: passwordController2,  // Initialized with widget.text2
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 350,
                  child: Image.asset('images/newpass.png'),
                ),
                const SizedBox(height: 20), // Added space between image and button
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()&&(passwordController1.text==passwordController2.text)) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialog(
                            context,
                            text1: 'Congratulations',
                            text2: 'Your account is ready to use',
                            text3: 'Continue',
                            imagePath: 'images/Congrat.png',
                            targetScreen: WelcomeScreen(),
                          );
                        },
                      );
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
