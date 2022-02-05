import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/data/models/pokemon_ability_model.dart';
part 'pokemon_abilities_model.g.dart';

@JsonSerializable()
class PokemonAbilities {
  PokemonAbilities(
    this.isHidden,
    this.slot,
    this.ability,
  );
  @JsonKey(name: 'is_hidden')
  bool? isHidden;
  int? slot;
  PokemonAbility? ability;

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilitiesToJson(this);
}
