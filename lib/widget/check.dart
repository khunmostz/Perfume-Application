import 'package:flutter/material.dart';

class CheckList extends StatelessWidget {
  const CheckList({
    Key? key,
    required this.text, required this.check,
  }) : super(key: key);

  final String text;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: check, onChanged: (val) {}),
        Text(text),
      ],
    );
  }
}
