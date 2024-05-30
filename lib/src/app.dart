import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _allChoices = [
    'cinema', 'petanque', 'fitness', 'League Of Legend',
    'basket', 'shopping', 'programmation',
  ];
  final List<String> _selectedChoices = [];

  void _onChoiceSelected(String choice) {
    setState(() {
      if (!_selectedChoices.contains(choice)) {
        _selectedChoices.add(choice);
        _allChoices.remove(choice);
      }
    });
  }

  void _onChoiceDeselected(String choice) {
    setState(() {
      if (_selectedChoices.contains(choice)) {
        _selectedChoices.remove(choice);
        _allChoices.add(choice);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          Expanded(child: Header(selectedChoices: _selectedChoices, onChoiceDeselected: _onChoiceDeselected)),
          Footer(choices: _allChoices, onChoiceSelected: _onChoiceSelected),
        ],
      ),
    );
  }
}
