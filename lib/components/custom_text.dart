import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const CustomText({this.text, this.style});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
