import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final TextInputType keyboardType;

  CustomTextField({
    this.icon,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 4.0,
          )
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: (val) {},
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
