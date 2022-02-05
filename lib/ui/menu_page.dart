import 'package:flutter/material.dart';
import 'package:pokeapi/ui/random_pokemon/output_random_pokemon_page.dart';
import 'package:pokeapi/ui/search_pokemon/search_pokemon_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokeAPI'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchPokemonPage()),
                );
              },
              child: const Text('Go to the search pokemon page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OutputRandomPokemonPage()),
                );
              },
              child: const Text('Go to the output random pokemon page'),
            ),
          ],
        ),
      ),
    );
  }
}
