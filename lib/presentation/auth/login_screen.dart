import 'package:auth_ui/presentation/auth/forget_pass_screen.dart';
import 'package:auth_ui/presentation/auth/signup_screen.dart';
import 'package:auth_ui/presentation/components/my_app_bar.dart';
import 'package:auth_ui/presentation/components/my_button.dart';
import 'package:auth_ui/presentation/components/my_inputfields.dart';
import 'package:auth_ui/presentation/components/my_texts.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: 'Login', startIcon: true),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  AuthField(
                    controller: numberController,
                    hintText: '8565856585',
                    labelText: 'Mobile Number',
                    maxLength: 10,
                    digitOnly: true,
                    condition: (text) => text.length == 10,
                  ),
                  SizedBox(height: 15),
                  PasswordField(
                    controller: passwordController,
                    hintText: 'Password',
                    labelText: 'Password',
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassScreen(),
                            ),
                          );
                        },
                        child: PlaceHolderText(
                          text: 'forget password?',
                          color: Color(0xFF151515),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  AuthButton(text: 'Login', onClick: () {}, enabled: true),
                  SizedBox(height: 20),
                  DidNotHaveTextWidget(
                    startText: "Didn't Have an Account?",
                    endText: 'Sign Up',
                    onTextClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                  ),
                  OtherLoginSignupMethods(onApple: () {}, onGoogle: () {}),
                  OrWidget(),
                  InkWell(
                    onTap: () {},
                    child: AppBarText(
                      text: "Continue as Guest",
                      fontSize: 20,
                      color: Colors.black45,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        AppBarText(text: "Or", fontSize: 18, color: Colors.black45),
        SizedBox(height: 20),
      ],
    );
  }
}

class OtherLoginSignupMethods extends StatelessWidget {
  const OtherLoginSignupMethods({
    super.key,
    required this.onApple,
    required this.onGoogle,
  });

  final VoidCallback onGoogle;
  final VoidCallback onApple;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrWidget(),
        MyIconButton(
          text: 'Continue with Google',
          icon: 'assets/images/google.png',
          onClick: () {},
        ),
        SizedBox(height: 20),
        MyIconButton(
          text: 'Continue with Apple',
          icon: 'assets/images/apple.png',
          onClick: () {},
        ),
      ],
    );
  }
}

class DidNotHaveTextWidget extends StatelessWidget {
  const DidNotHaveTextWidget({
    super.key,
    required this.startText,
    required this.endText,
    required this.onTextClick,
  });

  final String startText;
  final String endText;
  final VoidCallback onTextClick;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            PlaceHolderText(text: startText),
            InkWell(
              onTap: () => onTextClick(),
              child: AppBarText(text: endText, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
