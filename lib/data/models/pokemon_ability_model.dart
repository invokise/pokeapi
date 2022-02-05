import 'package:json_annotation/json_annotation.dart';
part 'pokemon_ability_model.g.dart';

@JsonSerializable()
class PokemonAbility {
  PokemonAbility(
    this.name,
    this.url,
  );

  String? name;
  String? url;

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}
