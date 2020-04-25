import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tart_labs_store/components/custom_text.dart';
import 'package:tart_labs_store/utils/color_resources.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const PrimaryButton({
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: RaisedButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        color: ColorResources.FADED_RED,
        onPressed: onPressed,
        child: CustomText(
          text: buttonText,
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            width: 2,
            color: ColorResources.PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
