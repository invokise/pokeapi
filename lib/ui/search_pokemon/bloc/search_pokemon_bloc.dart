import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokeapi/data/datasources/pokemon_api.dart';
import 'package:pokeapi/data/models/pokemon_model.dart';

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  SearchPokemonBloc() : super(SearchPokemonInitial()) {
    on<SearchPokemonLoadedEvent>(_onSearchPokemonLoadedEvent);
  }

  _onSearchPokemonLoadedEvent(
      SearchPokemonLoadedEvent event, Emitter<SearchPokemonState> emit) async {
    emit(SearchPokemonLoadingState());
    try {
      final searchLoadedPokemons = await PokemonAPI().searchPokemon(event.name);
      emit(SearchPokemonSuccessState(pokemon: searchLoadedPokemons));
    } catch (e) {
      emit(SearchPokemonFailureState(error: e));
    }
  }
}
