import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../../favorites/data/repository/isar_service.dart';
import 'package:pokemon/my_pokemons/data/data/model/my_pokemons_model.dart';

class MyPokemonService {
  Future<Isar> openIsar() async {
    return IsarService.isarInstance!;
  }

  Future<void> createMyPokemon(MyPokemonModel newMyPokemonModel) async {
    final isar = await openIsar();
    isar.writeTxnSync<int>(
        () => isar.myPokemonModels.putSync(newMyPokemonModel));
  }

  Future<void> deleteMyPokemon(int id) async {
    final isar = await openIsar();
    isar.writeTxn(() async => await isar.myPokemonModels.delete(id));
  }

  Stream<List<MyPokemonModel>> getAllMyPokemon() async* {
    final isar = await openIsar();
    yield* isar.myPokemonModels.where().watch(fireImmediately: true);
  }

  savePokemon({
    required String name,
    required int height,
    int? weight,
    List<String>? types,
  }) async {
    final isar = await openIsar();
    final myPokemonDB = isar.myPokemonModels;
    final existingItem = myPokemonDB.where().filter().nameContains(name);
    if (existingItem.isEmptySync()) {
      // create a pokemon
      final myPokemon = MyPokemonModel()
        ..name = name
        ..weight = weight
        ..height = height
        ..types = types;
      createMyPokemon(myPokemon);
    } else {

      throw Exception("Pokemon Name Already Exist");
    }
  }
}

final myPokemonServiceProvider = Provider((ref) => MyPokemonService());
