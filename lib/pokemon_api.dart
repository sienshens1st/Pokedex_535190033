import 'dart:convert';
import 'package:flutter/cupertino.dart';

class Pokemons {
  List<PokemonBaseStat> pokemons = [];


  Pokemons.fromJson(List<dynamic> json) {
    if (json == null) return;

    json.forEach((item) {
      final pokemon = PokemonBaseStat.fromJson(item);
      pokemons.add(pokemon);
    });
  }
}

class PokemonBaseStat {
  String name;
  String url;

  PokemonBaseStat({
    this.name,
    this.url,
  });

  factory PokemonBaseStat.fromJson(Map<String, dynamic> json) {
    return PokemonBaseStat(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

// Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

class Pokemon {
  int id;
  String name;
  Species species;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;
  List<Species> forms;
  int weight;
  int base_experience;
  int height;


  Pokemon({
    this.id,
    this.name,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.forms,
    @required this.weight,
    @required this.base_experience,
    @required this.height,

  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    id: json["id"],
    name: json["name"],
    weight: json["weight"],
    height: json["height"],
    base_experience: json["base_experience"],
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    forms: List<Species>.from(
      json["forms"].map((x) => Species.fromJson(x)),
    ),
    species: Species.fromJson(json["species"]),
    sprites: Sprites.fromJson(json["sprites"]),

  );
}




class Sprites {
  String frontDefault;

  Sprites({
    this.frontDefault,

  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    frontDefault: json["front_default"],

  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
  };
}

class Stat {
  int baseStat;
  int effort;
  Species stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: Species.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class Type {
  int slot;
  Species type;

  Type({
    this.slot,
    this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: Species.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type.toJson(),
  };
}

class Species {
  String name;
  String url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

