import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../model/favorite_pokemon_db.dart';

class IsarService {
  static Isar? _isar;
  static Isar? get isarInstance => _isar;

  static Future<void> initialize() async {
    if (_isar == null) {
      final dir = await getApplicationDocumentsDirectory();

      _isar = await Isar.open(
        [FavoritePokemonDBSchema], // Pass the adapters for collections
        inspector: true,
        directory: dir.path,
      );
    }
  }
}