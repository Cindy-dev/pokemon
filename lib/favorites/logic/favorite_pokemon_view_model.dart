import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/favorites/data/model/favorite_pokemon_db.dart';
import '../data/repository/favorite_pokemon_services.dart';
import 'favorite_pokemon_states.dart';

class FavoritePokemonVM extends StateNotifier<FavoritePokemonState> {
  final Ref ref;
  FavoritePokemonVM(this.ref) : super(const FavoritePokemonInitial());

  addToFavorite({
    required int height,
    required String name,
    required String image,
    required int weight,
    required int pokemonId,
    required List<String> type,
  }) {
    state = const FavoritePokemonLoading();
    try {
      final result = ref
          .read(favoritePokemonServiceProvider)
          .toggleFavoriteItem(
              height: height,
              name: name,
              image: image,
              weight: weight,
              pokemonId: pokemonId,
              type: type);
      state = FavoritePokemonAdded(result);
    } catch (e) {
      state = FavoritePokemonError(e.toString());
    }
  }
}

final favoritePokemonVM =
    StateNotifierProvider<FavoritePokemonVM, FavoritePokemonState>(
        (ref) => FavoritePokemonVM(ref));

final fetchFavoritePokemonVM = StreamProvider<List<FavoritePokemonDB>>((ref) {
  final favePokemons =
      ref.watch(favoritePokemonServiceProvider).getAllFavoritePokemon();
  return favePokemons;
});
