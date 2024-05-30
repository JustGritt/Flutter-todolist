import 'package:flutter/material.dart';
import 'widgets/pokemon_detail.dart';

class Header extends StatelessWidget {
  final List<String> selectedChoices;
  final Function(String) onChoiceDeselected;

  const Header({super.key, required this.selectedChoices, required this.onChoiceDeselected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.deepPurple[400],
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Vos choix :',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Cliquez sur les choix en dessous !',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0, // Horizontal spacing between chips
            runSpacing: 8.0, // Vertical spacing between chips
            children: selectedChoices.map((choice) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PokemonDetail(pokemonName: choice),
                  ),
                );
              },
              onLongPress: () => onChoiceDeselected(choice),
              child: Chip(
                label: Text(choice),
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
