import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:pokemon/favorites/data/model/favorite_pokemon_db.dart';
import 'isar_service.dart';

class FavoritePokemonService {
  Future<Isar> openIsar() async {
    return IsarService.isarInstance!;
  }

  Future<void> createFavorite(
    FavoritePokemonDB newFavoritePokemon,
  ) async {
    final isar = await openIsar();
    isar.writeTxnSync<int>(
        () => isar.favoritePokemonDBs.putSync(newFavoritePokemon));
  }

  Future<bool> existingItemFave(String pokemonName) async {
    final isar = await openIsar();
    final favoriteDB = isar.favoritePokemonDBs;
    final existingItem = favoriteDB.where().filter().nameContains(pokemonName);
    return existingItem.isEmptySync();
  }

  Stream<List<FavoritePokemonDB>> getAllFavoritePokemon() async* {
    final isar = await openIsar();
    yield* isar.favoritePokemonDBs.where().watch(fireImmediately: true);
  }

  toggleFavoriteItem(
      {required int height,
      required String name,
      required String image,
      required int weight,
      required int pokemonId,
      required List<String> type,
      int? id}) async {
    final isar = await openIsar();
    final favoriteDB = isar.favoritePokemonDBs;

    final existingItem = favoriteDB.where().filter().nameContains(name);

    if (existingItem.isEmptySync()) {
      // Insert or update pokemon favorite
      final favoriteStation = FavoritePokemonDB()
        ..name = name
        ..type = type
        ..weight = weight
        ..height = height
        ..image = image
        ..pokemonId = pokemonId;
      createFavorite(favoriteStation);
    } else {
      final isar = await openIsar();
      final itemIdToDelete = pokemonId; // user-selected id
      await isar.writeTxn(() async {
        await isar.favoritePokemonDBs.delete(itemIdToDelete);
      });
    }
  }
}

final favoritePokemonServiceProvider =
    Provider((ref) => FavoritePokemonService());
