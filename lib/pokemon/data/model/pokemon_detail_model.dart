import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:pokemon/pokemon/data/model/sprites.dart';
import 'package:pokemon/pokemon/data/model/type.dart';
part 'pokemon_detail_model.g.dart';

@collection
class PokemonDetailModel {
  Id id = Isar.autoIncrement;
  int? height;
  int? pokemonId;
  String? name;
  List<String>? pastTypes;
  Sprites? sprites;
  List<TypeModel>? types;
  int? weight;

 PokemonDetailModel({
    this.height,
    this.pokemonId,
    this.name,
    this.pastTypes,
    this.sprites,
    this.types,
    this.weight,
  });
  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailModel(
        height: json["height"],
        pokemonId: json["id"],
        name: json["name"],
        weight: json["weight"],
        sprites: Sprites.fromJson(json["sprites"]),
        pastTypes: List<String>.from(json["past_types"].map((x) => x)),
        types: List<TypeModel>.from(json["types"].map((x) => TypeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "id": pokemonId,
        "name": name,
        "past_types": List<dynamic>.from(pastTypes!.map((x) => x)),
        "sprites": sprites!.toJson(),
        "weight": weight,
      };
}

