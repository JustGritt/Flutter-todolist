import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../global.dart';

class PokemonDetail extends StatefulWidget {
  final String pokemonName;

  const PokemonDetail({super.key, required this.pokemonName});

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  Map<String, dynamic>? _pokemonData;

  @override
  void initState() {
    super.initState();
    _fetchPokemonDetail();
  }

  Future<void> _fetchPokemonDetail() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${widget.pokemonName}'));
    if (response.statusCode == 200) {
      setState(() {
        _pokemonData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load Pokémon details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global().selectedColor,
      appBar: AppBar(
        title: Text(
          widget.pokemonName[0].toUpperCase() + widget.pokemonName.substring(1).toLowerCase(),
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Global().selectedColor,
      ),
      body: _pokemonData == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: NetworkImage(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${_pokemonData!['id']}.png',
                      ),
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Height: ${_pokemonData!['height']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Weight: ${_pokemonData!['weight']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Abilities:',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  ...(_pokemonData!['abilities'] as List)
                      .map((ability) => Text(
                            ability['ability']['name'],
                            style: const TextStyle(color: Colors.white),
                          ))
                      ,
                ],
              ),
            ),
    );
  }
}
