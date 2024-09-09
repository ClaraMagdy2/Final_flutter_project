import 'package:flutter/material.dart';

Widget buildProfileInfoCard({
  required IconData icon,
  required String label,
  required String value,
}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: ListTile(
      leading: Icon(icon, color: Colors.deepPurpleAccent, size: 30),
      title: Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: Text(value, style: TextStyle(fontSize: 16, color: Colors.black54)),
    ),
  );
}
