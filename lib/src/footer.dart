import 'package:flutter/material.dart';
import 'choice_item.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final choices = [
      'cinema', 'petanque', 'fitness', 'League Of Legend',
      'basket', 'shopping', 'programmation'
    ];

    return Wrap(
      children: choices.map((choice) => ChoiceItem(label: choice)).toList(),
    );
  }
}
