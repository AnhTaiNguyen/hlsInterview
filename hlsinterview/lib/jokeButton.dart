import 'package:flutter/material.dart';

class JokerButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final VoidCallback onPressed;

  JokerButton({
    required this.buttonColor,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        padding: EdgeInsets.all(16.0),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
