// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class myCheckBox extends StatefulWidget {
  myCheckBox({super.key, required this.value, required this.onChanged});
  final bool value;
  void Function(bool?)? onChanged;

  @override
  State<myCheckBox> createState() => _myCheckBoxState();
}

class _myCheckBoxState extends State<myCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.value,
      onChanged: widget.onChanged,
      activeColor: Colors.amberAccent,
    );
  }
}
