part of 'search_pokemon_bloc.dart';

@immutable
abstract class SearchPokemonEvent {}

class SearchPokemonLoadedEvent extends SearchPokemonEvent {
  final String name;

  SearchPokemonLoadedEvent(this.name);
}
