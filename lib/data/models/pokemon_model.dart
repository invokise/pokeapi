import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/data/models/pokemon_abilities_model.dart';
part 'pokemon_model.g.dart';

@JsonSerializable()
class Pokemon {
  Pokemon(
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
  );

  int? id;
  String? name;
  @JsonKey(name: 'base_experience')
  int? baseExperience;
  int? height;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  int? order;
  int? weight;
  List<PokemonAbilities>? abilities;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
