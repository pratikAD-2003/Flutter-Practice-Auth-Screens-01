import 'package:auth_ui/presentation/components/my_texts.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    required this.onClick,
    this.enabled = true,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onClick;
  final bool isLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: enabled ? Color(0xFF151515) : Color(0xFFc4c4c4),
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
        onTap: enabled && !isLoading ? onClick : null,
        borderRadius: BorderRadius.circular(17),
        child: Container(
          width: double.infinity,
          alignment: AlignmentGeometry.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Color(0xFF151515),
            borderRadius: BorderRadius.circular(17),
            border: null,
          ),
          child: isLoading
              ? SizedBox(
                  height: 26,
                  width: 26,
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : AppBarText(text: text, fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onClick,
    this.isLoading = false,
  });

  final String text;
  final String icon;
  final VoidCallback onClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
        onTap: !isLoading ? onClick : null,
        borderRadius: BorderRadius.circular(17),
        child: Container(
          width: double.infinity,
          alignment: AlignmentGeometry.center,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: Color(0xFFc4c4c4)),
          ),
          child: isLoading
              ? SizedBox(
                  height: 26,
                  width: 26,
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Image.asset(icon, height: 30, width: 30),
                    PlaceHolderText(
                      text: text,
                      fontSize: 17,
                      color: Color(0xFF151515),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
