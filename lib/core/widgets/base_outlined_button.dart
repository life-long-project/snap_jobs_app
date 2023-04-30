import 'package:flutter/material.dart';

class BaseOutlinedButton extends StatelessWidget {
  const BaseOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        child: Text(text),
        style: OutlinedButton.styleFrom(
          fixedSize: Size.fromWidth(110),
        ));
  }
}
