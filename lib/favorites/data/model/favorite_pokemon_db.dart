import 'package:isar/isar.dart';
import 'package:pokemon/pokemon/data/model/pokemon_detail_model.dart';
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
