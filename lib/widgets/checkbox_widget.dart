import 'dart:ui';

import 'package:flutter/material.dart';

class SafeCheckBox extends StatefulWidget {
  final String title;
  final bool initialValue;
  final Function(bool) onChanged;

  const SafeCheckBox(
      {super.key,
      required this.title,
      required this.initialValue,
      required this.onChanged});

  @override
  SafeCheckBoxState createState() => SafeCheckBoxState(initialValue);
}

class SafeCheckBoxState extends State<SafeCheckBox> {
  bool _isChecked = false;

  SafeCheckBoxState(bool initialValue) {
    _isChecked = initialValue;
  }

  void _changeCheckboxState(bool? state) {
    setState(() {
      _isChecked = state!;
    });
    widget.onChanged(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10), child: Row(
      children: [
        Checkbox(
            value: _isChecked,
            onChanged: (bool? state) {
              _changeCheckboxState(state);
            }),
        Text(widget.title, style: const TextStyle(fontSize: 18),)
      ],
    ),);
  }
}
