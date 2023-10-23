import 'package:flutter/material.dart';

class BoxButton extends StatelessWidget {
  final String text;
  VoidCallback action;

  BoxButton({
    super.key,
    required this.text,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: action,
      child: Text(text),
      color: Colors.grey,

    );
  }
}
