import 'dart:convert';
import 'dart:math';

import 'package:pokeapi/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonAPI {
  static const _baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
  Future<Pokemon> searchPokemon(String name) async {
    final _response = await http.get(Uri.parse(_baseUrl + name));

    if (_response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(_response.body));
    } else {
      throw Exception();
    }
  }

  Future<Pokemon> getRandomPokemon() async {
    final _random = Random();
    final _id = _random.nextInt(1118);
    final _url = Uri.parse(_baseUrl + _id.toString());
    final _response = await http.get(_url);

    if (_response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(_response.body));
    } else {
      throw Exception();
    }
  }
}
