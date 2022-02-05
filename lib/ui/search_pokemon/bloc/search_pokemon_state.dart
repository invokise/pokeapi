part of 'search_pokemon_bloc.dart';

@immutable
abstract class SearchPokemonState {}

class SearchPokemonInitial extends SearchPokemonState {}

class SearchPokemonLoadingState extends SearchPokemonState {}

class SearchPokemonSuccessState extends SearchPokemonState {
  final Pokemon pokemon;

  SearchPokemonSuccessState({required this.pokemon});
}

class SearchPokemonFailureState extends SearchPokemonState {
  final dynamic error;

  SearchPokemonFailureState({required this.error});
}
