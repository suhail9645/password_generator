
import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
  });
  final String text;
  final Function() onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(6), color: color),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title});
  final bool value;
  final Function(bool? value) onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: Color.fromARGB(255, 169, 165, 165),
        fontSize: 18,
        fontWeight: FontWeight.bold);
    return CheckboxListTile(
      title: Text(
        title,
        style: textStyle,
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
