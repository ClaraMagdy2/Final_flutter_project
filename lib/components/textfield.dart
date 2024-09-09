import 'package:flutter/material.dart';

Padding buildTextFormField({
  Icon? prefix,
  required String hintText,
  required TextInputType keyboardType,
  required String? Function(String?)? validator,
  IconButton? suffix,
  required TextEditingController controller,
  bool obscureText = false, 
}) {
  return Padding( 
  
 padding: const EdgeInsets.all(10.0),
  child:TextFormField(
    controller: controller,
    maxLength: 30,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      prefixIcon: prefix,
      counterText: "",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: Colors.deepPurpleAccent),
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 20,
      ),
      suffixIcon: suffix,
    ),
    validator: validator,
  ));
}

