import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/consts/app_text_styles.dart';
import 'package:pokeapi/ui/random_pokemon/bloc/random_pokemon_bloc.dart';

class OutputRandomPokemonPage extends StatelessWidget {
  const OutputRandomPokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final randomPokemonBloc = BlocProvider.of<RandomPokemonBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Pokemon'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  randomPokemonBloc.add(RandomPokemonLoadedEvent());
                },
                child: const Text('Output random pokemon'),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<RandomPokemonBloc, RandomPokemonState>(
                builder: (context, state) {
                  if (state is RandomPokemonInitial) {
                    return const Text('No data!');
                  }
                  if (state is RandomPokemonLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is RandomPokemonFailureState) {
                    return Text('Error: ${state.error.toString()}!');
                  }
                  if (state is RandomPokemonLoadedState) {
                    final index = state.pokemon.abilities!.length - 1;
                    return SizedBox(
                      width: 400,
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
                  } else {
                    return const Text('No data');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
