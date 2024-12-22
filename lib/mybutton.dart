import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Text(
            'Calculate',
            style: TextStyle(
                // Ensure text is visible
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
