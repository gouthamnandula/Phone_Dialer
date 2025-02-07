import 'package:flutter/material.dart';

class DialButton extends StatelessWidget {
  final String number;
  final VoidCallback onPressed;

  const DialButton({
    super.key,
    required this.number,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        number,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
