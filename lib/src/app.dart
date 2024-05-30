import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'header.dart';
import 'footer.dart';
import 'global.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _allChoices = [];
  final List<String> _selectedChoices = [];

  @override
  void initState() {
    super.initState();
    _fetchPokemonData();
  }

  Future<void> _fetchPokemonData() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<String> pokemonNames = (data['results'] as List).map((pokemon) => pokemon['name'] as String).toList();
      setState(() {
        _allChoices.addAll(pokemonNames);
      });
    } else {
      throw Exception('Failed to load Pokémon data');
    }
  }

  void _onChoiceSelected(String choice) {
    setState(() {
      if (_selectedChoices.contains(choice)) {
        _selectedChoices.remove(choice);
      } else {
        _selectedChoices.add(choice);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<Global>(context).selectedColor,
        toolbarHeight: 8,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(child: Header(selectedChoices: _selectedChoices)),
          Footer(choices: _allChoices, onChoiceSelected: _onChoiceSelected, selectedChoices: _selectedChoices),
        ],
      ),
    );
  }
}
