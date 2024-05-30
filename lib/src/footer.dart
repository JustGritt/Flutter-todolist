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
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0), 
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,
          children: choices.map((choice) => GestureDetector(
            onTap: () => onChoiceSelected(choice),
            child: ChoiceItem(label: choice),
          )).toList(),
        ),
      ),
    );
  }
}
