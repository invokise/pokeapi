import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/ui/search_pokemon/bloc/search_pokemon_bloc.dart';
import 'package:pokeapi/ui/search_pokemon/search_result.dart';

class SearchPokemonPage extends StatefulWidget {
  const SearchPokemonPage({Key? key}) : super(key: key);

  @override
  State<SearchPokemonPage> createState() => _SearchPokemonPageState();
}

class _SearchPokemonPageState extends State<SearchPokemonPage> {
  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    final pokemonBloc = BlocProvider.of<SearchPokemonBloc>(context);
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Pokemon'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Stack(
              children: [
                Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter pokemon name!';
                      }
                      return null;
                    },
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter pokemon name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          pokemonBloc.add(SearchPokemonLoadedEvent(
                              textEditingController.text.toLowerCase()));
                        }
                      },
                      child: const Text('Search'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Flexible(
              child: SearchResult(),
            ),
          ],
        ),
      ),
    );
  }
}
