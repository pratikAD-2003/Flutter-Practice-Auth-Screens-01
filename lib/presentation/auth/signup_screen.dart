import 'package:auth_ui/presentation/auth/login_screen.dart';
import 'package:auth_ui/presentation/components/my_app_bar.dart';
import 'package:auth_ui/presentation/components/my_button.dart';
import 'package:auth_ui/presentation/components/my_inputfields.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: 'Register', startIcon: true),
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
                  AuthField(
                    controller: emailController,
                    hintText: 'xyz@gmail.com',
                    labelText: 'Email',
                    condition: (text) => text.endsWith('@gmail.com'),
                  ),
                  SizedBox(height: 15),
                  PasswordField(
                    controller: passwordController,
                    hintText: 'Password',
                    labelText: 'Password',
                  ),
                  SizedBox(height: 15),
                  PasswordField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
                  ),  
                  SizedBox(height: 30),
                  AuthButton(text: 'Sign Up', onClick: () {}, enabled: true),
                  SizedBox(height: 20),
                  DidNotHaveTextWidget(
                    startText: "Have an Account?",
                    endText: 'Sign In',
                    onTextClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                  OtherLoginSignupMethods(onApple: () {}, onGoogle: () {}),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
