import 'package:flutter/material.dart';
import 'package:tart_labs_store/constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const PrimaryButton({
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: FADED_RED,
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          width: 2,
          color: PRIMARY_COLOR,
        ),
      ),
    );
  }
}
