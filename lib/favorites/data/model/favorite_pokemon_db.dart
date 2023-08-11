import 'package:isar/isar.dart';
part 'favorite_pokemon_db.g.dart';

@Collection()
class FavoritePokemonDB{
  Id id = Isar.autoIncrement;
  int? height;
  String? name;
  String? image;
  int? weight;
  int? pokemonId;
  List<String>? type;
}
