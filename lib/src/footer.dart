import 'package:flutter/material.dart';
import 'choice_item.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final choices = [
      'cinema', 'petanque', 'fitness', 'League Of Legend',
      'basket', 'shopping', 'programmation', 
    ];

    return Container(
      height: 300.0,
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Wrap(
          children: choices.map((choice) => ChoiceItem(label: choice)).toList(),
        ),
      ),
    );
  }
}
