import 'package:flutter/material.dart';

class ChoiceItem extends StatelessWidget {
  final String label;

  const ChoiceItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(width: 2.0, color: Colors.transparent),
        ),
      ),
    );
  }
}
