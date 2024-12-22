import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const MyTextField(
      {super.key, required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: labelText),
      ),
    );
  }
}
