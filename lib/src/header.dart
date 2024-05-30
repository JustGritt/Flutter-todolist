import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'widgets/pokemon_detail.dart';
import 'widgets/settings_page.dart'; 
import 'global.dart';

class Header extends StatelessWidget {
  final List<String> selectedChoices;

  const Header({super.key, required this.selectedChoices});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Provider.of<Global>(context).selectedColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              const Text('Vos choix :', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Cliquez sur les choix en dessous !', style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: selectedChoices.map((choice) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonDetail(pokemonName: choice),
                      ),
                    );
                  },
                  child: Chip(
                    label: Text(choice),
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(width: 2.0, color: Colors.transparent),
                    ),
                  ),
                )).toList(),
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 0,
            child: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}