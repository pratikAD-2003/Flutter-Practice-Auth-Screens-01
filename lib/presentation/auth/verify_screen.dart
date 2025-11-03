import 'package:auth_ui/presentation/auth/forget_pass_screen.dart';
import 'package:auth_ui/presentation/components/my_app_bar.dart';
import 'package:auth_ui/presentation/components/my_button.dart';
import 'package:auth_ui/presentation/components/my_inputfields.dart';
import 'package:auth_ui/presentation/components/my_texts.dart';
import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final controllers = List.generate(4, (_) => TextEditingController());
  final focusNodes = List.generate(4, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: 'Verify', startIcon: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                MyCenterImageWidget(icon: 'assets/images/otp.png'),
                SizedBox(height: 40),
                AppBarText(text: 'Enter OTP'),
                SizedBox(height: 20),
                PlaceHolderText(
                  text: "A 4 Digits OTP has been sent to",
                  color: Colors.black45,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                AppBarText(text: '+91 5856584558', fontSize: 16),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: OtpInputField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        nextNode: index < 3 ? focusNodes[index + 1] : null,
                        previousNode: index > 0 ? focusNodes[index - 1] : null,
                      ),
                    );
                  }),
                ),
                SizedBox(height: 30),
                AuthButton(text: 'Verify', onClick: () {}, enabled: true),
                SizedBox(height: 20),
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppBarText(
                      text: "Resend OTP",
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    AppBarText(
                      text: "(00:12)",
                      fontSize: 18,
                      color: Colors.black38,
                    ),
                  ],
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
