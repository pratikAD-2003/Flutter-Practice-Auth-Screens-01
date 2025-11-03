import 'package:auth_ui/presentation/components/my_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.onRead = false,
    this.maxLine = 1,
    this.maxLength = -1,
    this.digitOnly = false,
    required this.condition,
  });

  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool onRead;
  final int maxLine;
  final int maxLength;
  final bool digitOnly;
  final bool Function(String text) condition;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool isMatchedCondition;

  @override
  void initState() {
    super.initState();
    // Initialize the condition once
    isMatchedCondition = widget.condition(widget.controller.text);

    // Listen for text changes
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final newCondition = widget.condition(widget.controller.text);
    if (newCondition != isMatchedCondition) {
      setState(() {
        isMatchedCondition = newCondition;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (widget.labelText != null)
          PlaceHolderText(text: widget.labelText!, color: Color(0xff151515)),
        TextField(
          controller: widget.controller,
          style: TextStyle(
            fontFamily: 'Hamon',
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.black,
          ),
          readOnly: widget.onRead,
          maxLines: widget.maxLine,
          maxLength: widget.maxLength != -1 ? widget.maxLength : 300,
          inputFormatters: [
            if (widget.digitOnly)
              FilteringTextInputFormatter.digitsOnly, // allows only digits 0–9
          ],
          decoration: InputDecoration(
            counterText: '',
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Color(0xFFC4C4C4)),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Icon(
                Icons.check_circle,
                key: ValueKey(isMatchedCondition),
                size: 20,
                color: isMatchedCondition
                    ? const Color(0xFF151515)
                    : const Color(0xFFc4c4c4),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: const BorderSide(
                color: Color(0xFFC4C4C4),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.onRead = false,
    this.maxLine = 1,
    this.maxLength = -1,
    this.digitOnly = false,
  });

  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool onRead;
  final int maxLine;
  final int maxLength;
  final bool digitOnly;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (widget.labelText != null)
          PlaceHolderText(text: widget.labelText!, color: Color(0xff151515)),
        TextField(
          controller: widget.controller,
          style: TextStyle(
            fontFamily: 'Hamon',
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.black,
          ),
          readOnly: widget.onRead,
          maxLines: widget.maxLine,
          maxLength: widget.maxLength != -1 ? widget.maxLength : 300,
          inputFormatters: [
            if (widget.digitOnly)
              FilteringTextInputFormatter.digitsOnly, // allows only digits 0–9
          ],
          obscureText: !isVisible, // 👈 hides or shows password text
          decoration: InputDecoration(
            counterText: '',
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Color(0xFFC4C4C4)),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  size: 24,
                  color: const Color(0xFFc4c4c4),
                ),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: const BorderSide(
                color: Color(0xFFC4C4C4),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextNode;
  final FocusNode? previousNode;

  const OtpInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextNode,
    this.previousNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'Hamon',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFC4C4C4), width: 1.5),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && nextNode != null) {
            FocusScope.of(context).requestFocus(nextNode);
          } else if (value.isEmpty && previousNode != null) {
            FocusScope.of(context).requestFocus(previousNode);
          }
        },
      ),
    );
  }
}
