import 'dart:convert';
import 'dart:math';

import 'package:pokeapi/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonAPI {
  static const baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
  Future<Pokemon> searchPokemon(String name) async {
    final response = await http.get(Uri.parse(baseUrl + name));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  Future<Pokemon> getRandomPokemon() async {
    final random = Random();
    final id = random.nextInt(1118);
    final url = Uri.parse(baseUrl + id.toString());
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
