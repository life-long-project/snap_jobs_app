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
        style: OutlinedButton.styleFrom(
          fixedSize: const Size.fromWidth(110),
        ),
        child: Text(text));
  }
}
