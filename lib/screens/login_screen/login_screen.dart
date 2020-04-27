import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tart_labs_store/components/custom_text.dart';
import 'package:tart_labs_store/components/custom_text_field.dart';
import 'package:tart_labs_store/components/primary_button.dart';
import 'package:tart_labs_store/screens/home_screen/home_screen.dart';
import 'package:tart_labs_store/screens/login_screen/login_bloc.dart';
import 'package:tart_labs_store/utils/image_resources.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';
import 'package:tart_labs_store/utils/string_resources.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();
  final loginBloc = new LoginBloc();
  bool isButtonClicked = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageResources.BG_IMAGE),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 100),
              Image.asset(
                ImageResources.APP_ICON,
                width: 171,
                height: 184,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 42, vertical: 42),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      text: StringResource.EMAIL_TEXT,
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6),
                    CustomTextField(
                      icon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                      controller: usernameController,
                    ),
                    SizedBox(height: 8),
                    CustomText(
                      text: StringResource.PASSWORD_TEXT,
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6),
                    CustomTextField(
                      icon: Icons.lock_outline,
                      obscureText: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: isButtonClicked
                          ? CircularProgressIndicator()
                          : PrimaryButton(
                              buttonText: StringResource.SIGN_IN_TEXT,
                              onPressed: onLoginButtonPressed,
                            ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onLoginButtonPressed() async {
    setIsButtonClicked(true);
    bool isLoggedIn =
        await loginBloc.login(usernameController.text, passwordController.text);
    if (isLoggedIn) {
      final user = await PreferenceHelper.getName();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(userName: user),
        ),
      );
    } else {
      setIsButtonClicked(false);
    }
  }

  void setIsButtonClicked(bool isClicked) {
    setState(() {
      isButtonClicked = isClicked;
    });
  }
}
