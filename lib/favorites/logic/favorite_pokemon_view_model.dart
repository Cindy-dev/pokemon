import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/pokemon/data/model/pokemon_detail_model.dart';
import '../data/repository/favorite_pokemon_services.dart';
import 'favorite_pokemon_states.dart';

class FavoritePokemonVM extends StateNotifier<FavoritePokemonState> {
  final Ref ref;
  FavoritePokemonVM(this.ref) : super(const FavoritePokemonInitial());

  addToFavorite({required PokemonDetailModel pokemonDetailModel}) {
    state = const FavoritePokemonLoading();
    try {
      final result = ref
          .read(favoritePokemonServiceProvider)
          .toggleFavoriteItem(pokemonDetailModel: pokemonDetailModel);
      state = FavoritePokemonAdded(result);
    } catch (e) {
      state = FavoritePokemonError(e.toString());
    }
  }

  Stream<Future<Stream<List<PokemonDetailModel>>>> fetchFavorite() async* {
    state = const FavoritePokemonLoading();
    try {
      final result = ref
          .read(favoritePokemonServiceProvider)
          .getAllFavoritePokemon();
      state = FavoritePokemonLoaded(result);
    } catch (e) {
      state = FavoritePokemonError(e.toString());
      rethrow;
    }
  }
}

final favoritePokemonVM =
    StateNotifierProvider<FavoritePokemonVM, FavoritePokemonState>(
        (ref) => FavoritePokemonVM(ref));

final fetchFavoritePokemonVM = StreamProvider<List<PokemonDetailModel>>((ref) {
  final favePokemon =
  ref.watch(favoritePokemonServiceProvider).getAllFavoritePokemon();
  return favePokemon;
});
