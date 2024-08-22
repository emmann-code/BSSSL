import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CustomLabel({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.bodyLarge,
    );
  }
}
