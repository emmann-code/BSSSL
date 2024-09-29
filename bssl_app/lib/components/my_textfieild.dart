import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

import 'my_data_table.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.controller, required int maxLines, required List<FilteringTextInputFormatter> inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // Make sure this is imported for TextInputFormatter
//
// class CustomTextField extends StatelessWidget {
//   final String label;
//   final bool isPassword;
//   final TextInputType keyboardType;
//   final TextEditingController controller;
//   final int maxLines;
//   final List<TextInputFormatter> inputFormatters; // Use the general TextInputFormatter type
//
//   const CustomTextField({
//     Key? key,
//     required this.label,
//     this.isPassword = false,
//     this.keyboardType = TextInputType.text,
//     required this.controller,
//     this.maxLines = 1, // Provide a default value for maxLines
//     required this.inputFormatters, // Use the correct type here
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword,
//       keyboardType: keyboardType,
//       maxLines: maxLines,
//       inputFormatters: inputFormatters, // Apply inputFormatters correctly
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(),
//       ),
//     );
//   }
// }
