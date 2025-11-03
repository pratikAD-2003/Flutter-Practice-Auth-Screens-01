import 'package:auth_ui/presentation/auth/verify_screen.dart';
import 'package:auth_ui/presentation/components/my_app_bar.dart';
import 'package:auth_ui/presentation/components/my_button.dart';
import 'package:auth_ui/presentation/components/my_inputfields.dart';
import 'package:auth_ui/presentation/components/my_texts.dart';
import 'package:flutter/material.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: 'Forget', startIcon: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                MyCenterImageWidget(icon: 'assets/images/forget.png'),
                SizedBox(height: 40),
                AppBarText(text: 'Forget Password?'),
                SizedBox(height: 20),
                PlaceHolderText(
                  text:
                      "Don't worry! it happens. Please enter your phone number associated with your account.",
                  color: Colors.black45,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                AuthField(
                  controller: numberController,
                  hintText: '8565856585',
                  labelText: 'Mobile Number',
                  maxLength: 10,
                  digitOnly: true,
                  condition: (text) => text.length == 10,
                ),
                SizedBox(height: 30),
                AuthButton(
                  text: 'Get OTP',
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyOtpScreen(),
                      ),
                    );
                  },
                  enabled: true,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCenterImageWidget extends StatelessWidget {
  const MyCenterImageWidget({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.asset(icon, height: 200)],
    );
  }
}
