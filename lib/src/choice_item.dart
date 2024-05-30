import 'package:flutter/material.dart';

class ChoiceItem extends StatelessWidget {
  final String label;
  final bool isSelected;

  const ChoiceItem({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange[400] : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label),
    );
  }
}
