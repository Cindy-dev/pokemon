import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/my_pokemons/data/data/model/my_pokemons_model.dart';
import 'package:pokemon/my_pokemons/data/repository/my_pokemons_service.dart';
import 'my_pokemon_states.dart';

class MyPokemonVM extends StateNotifier<MyPokemonState> {
  final Ref ref;
  MyPokemonVM(this.ref) : super(const MyPokemonInitialState());

  createMyPokemon(
      {required String name,
      required int height,
      required int pokemonId,
      required String spriteUrl,
      int? weight,
      List<String>? types}) async {
    state = const MyPokemonLoadingState();
    try {
      await ref.read(myPokemonServiceProvider).savePokemon(
          name: name,
          height: height,
          pokemonId: pokemonId,
          spriteUrl: spriteUrl);
      state = const MyPokemonSuccessState();
    } catch (e) {
      state = MyPokemonErrorState(e.toString());
    }
  }

  Stream<Future<Stream<List<MyPokemonModel>>>> fetchMyPokemon() async* {
    state = const MyPokemonLoadingState();
    try {
          ref.read(myPokemonServiceProvider).getAllMyPokemon();
      state = const MyPokemonSuccessState();
    } catch (e) {
      state = MyPokemonErrorState(e.toString());
      rethrow;
    }
  }
}

final myPokemonVM = StateNotifierProvider<MyPokemonVM, MyPokemonState>(
    (ref) => MyPokemonVM(ref));

final fetchMyPokemonVM = StreamProvider<List<MyPokemonModel>>((ref) {
  final myPokemon =
      ref.watch(myPokemonServiceProvider).getAllMyPokemon();
  return myPokemon;
});
