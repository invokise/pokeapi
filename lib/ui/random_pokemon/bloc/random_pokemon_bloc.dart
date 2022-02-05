import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokeapi/data/datasources/pokemon_api.dart';
import 'package:pokeapi/data/models/pokemon_model.dart';

part 'random_pokemon_event.dart';
part 'random_pokemon_state.dart';

class RandomPokemonBloc extends Bloc<RandomPokemonEvent, RandomPokemonState> {
  RandomPokemonBloc() : super(RandomPokemonInitial()) {
    on<RandomPokemonLoadedEvent>(_onRandomPokemonLoadedEvent);
  }

  _onRandomPokemonLoadedEvent(
      RandomPokemonLoadedEvent event, Emitter<RandomPokemonState> emit) async {
    emit(RandomPokemonInitial());
    try {
      final randomLoadedPokemon = await PokemonAPI().getRandomPokemon();
      emit(RandomPokemonLoadedState(pokemon: randomLoadedPokemon));
    } catch (e) {
      emit(RandomPokemonFailureState(error: e));
    }
  }
}
