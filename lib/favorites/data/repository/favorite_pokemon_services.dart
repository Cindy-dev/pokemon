import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:pokemon/pokemon/data/model/pokemon_detail_model.dart';
import '../../../isar_service.dart';

class FavoritePokemonService {
  Future<Isar> openIsar() async {
    return IsarService.isarInstance!;
  }

  Future<void> createFavorite(
    PokemonDetailModel newFavoritePokemon,
  ) async {
    final isar = await openIsar();
    isar.writeTxnSync<int>(
        () => isar.pokemonDetailModels.putSync(newFavoritePokemon));
  }

  Future<bool> existingItemFave(String pokemonName) async {
     bool isExist = false;
    final isar = await openIsar();
    final favoriteDB = isar.pokemonDetailModels;
    final existingItem =
    favoriteDB.where().filter().nameContains(pokemonName);
    if(existingItem.isNotEmptySync()){
      isExist = true;
    }else{
      isExist = false;
    }

    print(isExist);
   // return existingItem.isEmptySync();
    return isExist;
  }

  Stream<List<PokemonDetailModel>> getAllFavoritePokemon() async* {
    final isar = await openIsar();
    yield* isar.pokemonDetailModels.where().watch(fireImmediately: true);
  }


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
      final isar = await openIsar();
      final itemIdToDelete = pokemonDetailModel.id;
      await isar.writeTxn(() async {
        await isar.pokemonDetailModels.delete(itemIdToDelete);
      });
    }
  }
}

final favoritePokemonServiceProvider =
    Provider((ref) => FavoritePokemonService());
