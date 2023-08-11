import 'package:equatable/equatable.dart';

class PokemonDetailModel extends Equatable {
  int? height;
  int? id;
  String? name;
  List<dynamic>? pastTypes;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

 PokemonDetailModel({
    this.height,
    this.id,
    this.name,
    this.pastTypes,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailModel(
        height: json["height"],
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
        sprites: Sprites.fromJson(json["sprites"]),
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "id": id,
        "name": name,
        "past_types": List<dynamic>.from(pastTypes!.map((x) => x)),
        "sprites": sprites!.toJson(),
        "weight": weight,
      };

  @override
  List<Object?> get props => [
        height,
        id,
        name,
        pastTypes,
        sprites,
        stats,
        types,
        weight,
      ];
}

class Sprites {
  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;
  Other? other;
  Sprites? animated;

  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.animated,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
        animated: json["animated"] == null
            ? null
            : Sprites.fromJson(json["animated"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other?.toJson(),
        "animated": animated?.toJson(),
      };
}

class Other {
  DreamWorld dreamWorld;
  OfficialArtwork officialArtwork;

  Other({
    required this.dreamWorld,
    required this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
        "official-artwork": officialArtwork.toJson(),
      };
}

class OfficialArtwork {
  String frontDefault;
  String frontShiny;

  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class DreamWorld {
  String frontDefault;
  dynamic frontFemale;

  DreamWorld({
    required this.frontDefault,
    this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class Stat {
  int? baseStat;
  int? effort;
  Detail? stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Detail.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toJson(),
      };
}

class Detail {
  final String name;
  final String url;

  Detail({
    required this.name,
    required this.url,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int slot;
  final Detail type;

  factory Type.fromJson(Map<String, dynamic> json) =>
      Type(slot: json["slot"], type: Detail.fromJson(json["type"]));
}
