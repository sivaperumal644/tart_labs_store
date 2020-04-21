import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function onChanged;

  CustomTextField({
    this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 4.0,
          )
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
