part of 'random_pokemon_bloc.dart';

@immutable
abstract class RandomPokemonState {}

class RandomPokemonInitial extends RandomPokemonState {}

class RandomPokemonLoadingState extends RandomPokemonState {}

class RandomPokemonLoadedState extends RandomPokemonState {
  final Pokemon pokemon;

  RandomPokemonLoadedState({required this.pokemon});
}

class RandomPokemonFailureState extends RandomPokemonState {
  final dynamic error;

  RandomPokemonFailureState({required this.error});
}
