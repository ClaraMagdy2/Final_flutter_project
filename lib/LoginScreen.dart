import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:medical_app_final_project/ForgetPassword.dart';
import 'package:medical_app_final_project/HomeScreen.dart';
import 'package:medical_app_final_project/SignUpScreen.dart';
import 'components/textfield.dart';

bool isObscure = true;
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  const LoginScreen({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController passwordController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the values passed via the widget
    nameController = TextEditingController(text: widget.text1.isNotEmpty ? widget.text1 : null);
    passwordController = TextEditingController(text: widget.text2.isNotEmpty ? widget.text2 : null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset('images/login.jpg'),
                ),
                const SizedBox(height: 20),

                // Username TextFormField with widget.text1 as the default text if not empty
                buildTextFormField(
                  prefix: Icon(Icons.person, color: Colors.black45),
                  hintText: "Username",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  controller: nameController,  // Initialized with widget.text1
                ),

                // Password TextFormField with widget.text2 as the default text if not empty
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
                  controller: passwordController,  // Initialized with widget.text2
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

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPass(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.deepPurpleAccent),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      String text = nameController.text;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(text1: widget.text1,text2: widget.text2,text3: widget.text3,text4: widget.text4,),  // Pass the username to the next page
                        ),
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
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                SizedBox(height: 40),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",  // Regular text
                        style: TextStyle(color: Colors.black54, fontSize: 17),
                      ),
                      TextSpan(
                        text: 'Create Account',  // Highlighted text
                        style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 17, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
