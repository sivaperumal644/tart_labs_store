import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tart_labs_store/components/custom_text.dart';
import 'package:tart_labs_store/components/custom_text_field.dart';
import 'package:tart_labs_store/components/primary_button.dart';
import 'package:tart_labs_store/screens/login_screen/bloc/login_event.dart';
import 'package:tart_labs_store/utils/image_resource.dart';
import 'package:tart_labs_store/utils/string_resource.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();
  LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    loginBloc.close();
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
              image: AssetImage(ImageResource.bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<LoginBloc, LoginState>(
            bloc: loginBloc,
            builder: (BuildContext context, LoginState state) {
              return ListView(
                children: <Widget>[
                  SizedBox(height: 100),
                  Image.asset(
                    ImageResource.appIcon,
                    width: 171,
                    height: 184,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 42, vertical: 42),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(
                          text: StringResource.emailText,
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
                          text: StringResource.passwordText,
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
                          child: (state is LoginLoadingState)
                              ? CircularProgressIndicator()
                              : PrimaryButton(
                                  buttonText: StringResource.signInText,
                                  onPressed: onLoginButtonPressed,
                                ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void onLoginButtonPressed() async {
    loginBloc.add(
      LoginButtonPressedEvent(
        email: usernameController.text,
        password: passwordController.text,
      ),
    );
  }
}
