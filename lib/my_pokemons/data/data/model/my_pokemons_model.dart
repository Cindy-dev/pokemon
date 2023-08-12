import 'package:isar/isar.dart';
part 'my_pokemons_model.g.dart';

@collection
class MyPokemonModel {
  Id id = Isar.autoIncrement;
  int? height;
  String? name;
  String? spriteUrl;
  int? weight;
  List<String>? types;

  MyPokemonModel({
    this.height,
    this.name,
    this.types ,
    this.weight,
    this.spriteUrl
  });
}