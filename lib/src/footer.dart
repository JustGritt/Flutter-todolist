import 'package:flutter/material.dart';
import 'choice_item.dart';

class Footer extends StatelessWidget {
  final List<String> choices;
  final Function(String) onChoiceSelected;

  const Footer({super.key, required this.choices, required this.onChoiceSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0, 
      padding: const EdgeInsets.all(16.0), 
      child: SingleChildScrollView(
        child: Wrap(
          children: choices.map((choice) => GestureDetector(
            onTap: () => onChoiceSelected(choice),
            child: ChoiceItem(label: choice),
          )).toList(),
        ),
      ),
    );
  }
}
