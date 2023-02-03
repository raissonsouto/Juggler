import 'package:flutter/material.dart';

class SafeSlider extends StatefulWidget {
  final int initialValue;
  final Function(int) onChanged;

  const SafeSlider(
      {super.key, required this.initialValue, required this.onChanged});

  @override
  SafeSliderState createState() => SafeSliderState(initialValue);
}

class SafeSliderState extends State<SafeSlider> {
  int _sliderValue = 12;

  SafeSliderState(int initialValue) {
    _sliderValue = initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("1"),
        Slider(
          value: _sliderValue.toDouble(),
          min: 1,
          max: 256,
          divisions: 256,
          onChanged: (double newValue) {
            setState(() {
              _sliderValue = newValue.round();
            });
            widget.onChanged(_sliderValue.round());
          },
        ),
        const Text("256"),
      ],
    );
  }
}
