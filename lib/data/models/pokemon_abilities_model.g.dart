// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_abilities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonAbilities _$PokemonAbilitiesFromJson(Map<String, dynamic> json) =>
    PokemonAbilities(
      json['is_hidden'] as bool?,
      json['slot'] as int?,
      json['ability'] == null
          ? null
          : PokemonAbility.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonAbilitiesToJson(PokemonAbilities instance) =>
    <String, dynamic>{
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
      'ability': instance.ability,
    };
