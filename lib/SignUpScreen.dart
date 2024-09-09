import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:medical_app_final_project/LoginScreen.dart';
import 'components/textfield.dart';

bool isObscure = true;
TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class SignUpScreen extends StatefulWidget{
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                buildTextFormField(
                  prefix: Icon(Icons.person,color: Colors.black45,),
                  hintText: "your Name",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a your name';
                    }
                    return null;
                  },
                  controller: nameController,
                ),
                buildTextFormField(
                  prefix: Icon(Icons.email,color: Colors.black45,),
                  hintText: "Email Address",
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
                buildTextFormField(
                  prefix: Icon(Icons.email,color: Colors.black45,),
                  hintText: "phone Number",
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length < 12) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  controller: phoneController,
                ),
                buildTextFormField(
                  prefix: Icon(Icons.lock,color: Colors.black45,),
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
                  controller: passwordController,
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
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      String name=nameController.text;
                      String pass=passwordController.text;
                      String email=emailController.text;
                      String phone=phoneController.text;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                          builder: (context) => LoginScreen(text1: name,text2:pass ,text3: email,text4: phone,),
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
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have account? ", // Regular text
                        style: TextStyle(color: Colors.black54, fontSize: 17),
                      ),
                      TextSpan(
                        text: 'Log in', // Highlighted text
                        style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 17, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(text1: '',text2: '',text4: '',text3: '',),
                            ),);

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
