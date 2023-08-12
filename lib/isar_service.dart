import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon/my_pokemons/data/data/model/my_pokemons_model.dart';
import 'pokemon/data/model/pokemon_detail_model.dart';

class IsarService {
  static Isar? _isar;
  static Isar? get isarInstance => _isar;

  static Future<void> initialize() async {
    if (_isar == null) {
      final dir = await getApplicationDocumentsDirectory();
      _isar = await Isar.open(
        [PokemonDetailModelSchema, MyPokemonModelSchema],
        inspector: true,
        directory: dir.path,
      );
    }
  }
}