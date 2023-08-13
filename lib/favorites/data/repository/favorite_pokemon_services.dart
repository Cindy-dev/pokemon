import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:pokemon/pokemon/data/model/pokemon_detail_model.dart';
import '../../../isar_service.dart';

class FavoritePokemonService {
  Future<Isar> openIsar() async {
    return IsarService.isarInstance!;
  }

  //function to create a favorite item
  Future<void> createFavorite(
    PokemonDetailModel newFavoritePokemon,
  ) async {
    final isar = await openIsar();
    isar.writeTxnSync<int>(
        () => isar.pokemonDetailModels.putSync(newFavoritePokemon));
  }
  //function to delete a favorite item
  Future<void> deleteFavorite(
    PokemonDetailModel pokemonDetailModel,
  ) async {
    final isar = await openIsar();
    final itemIdToDelete = pokemonDetailModel.id;
    await isar.writeTxn(() async {
      await isar.pokemonDetailModels.delete(itemIdToDelete);
    });
  }

  ///
  Future<bool> existingItemFave(String name) async {
    final isar = await openIsar();
    final favoriteDB = isar.pokemonDetailModels;
    final existingItem =
    favoriteDB.where().filter().nameContains(name);
    return existingItem.isEmptySync();
  }

  //function to fetch all favorite items
  Stream<List<PokemonDetailModel>> getAllFavoritePokemon() async* {
    final isar = await openIsar();
    yield* isar.pokemonDetailModels.where().watch(fireImmediately: true);
  }

  //function to check if a favorite item exist to either add or delete it
  toggleFavoriteItem({required PokemonDetailModel pokemonDetailModel}) async {
    final isar = await openIsar();
    final favoriteDB = isar.pokemonDetailModels;

    final existingItem =
        favoriteDB.where().filter().nameContains(pokemonDetailModel.name!);

    if (existingItem.isEmptySync()) {
      // Insert or update pokemon favorite
      final favoritePokemon = pokemonDetailModel;
      createFavorite(favoritePokemon);
    } else {
     deleteFavorite(pokemonDetailModel);
    }
  }
}

final favoritePokemonServiceProvider =
    Provider((ref) => FavoritePokemonService());
