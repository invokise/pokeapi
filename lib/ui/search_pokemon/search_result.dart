import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/consts/app_text_styles.dart';
import 'package:pokeapi/ui/search_pokemon/bloc/search_pokemon_bloc.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
      builder: (context, state) {
        if (state is SearchPokemonInitial) {
          return const Text('No data!');
        }
        if (state is SearchPokemonLoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is SearchPokemonFailureState) {
          return Text('Pokemons not founded: ${state.error.toString()}!');
        }
        if (state is SearchPokemonSuccessState) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Card(
                  color: Colors.white38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID: ${state.pokemon.id.toString()}',
                          style: AppTextStyles.white18,
                        ),
                        Text(
                          'Name: ${state.pokemon.name.toString()}',
                          style: AppTextStyles.white18,
                        ),
                        Text(
                          'Height: ${state.pokemon.height.toString()}',
                          style: AppTextStyles.white18,
                        ),
                        Text(
                          'Weight: ${state.pokemon.weight.toString()}',
                          style: AppTextStyles.white18,
                        ),
                        Text(
                          'Abilities: ${state.pokemon.abilities![index].ability!.name.toString()}',
                          style: AppTextStyles.white18,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Text('Error!');
        }
      },
    );
  }
}
