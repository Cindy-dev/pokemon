import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/favorites/data/repository/favorite_pokemon_services.dart';
import 'package:pokemon/pokemon/data/model/pokemon_detail_model.dart';

class AddFavoritePokemonViewModel extends StateNotifier<PokemonDetailModel> {
  final Ref ref;

  AddFavoritePokemonViewModel(this.ref) : super(PokemonDetailModel());

  Future<PokemonDetailModel?> addFavoritePokemon(
      PokemonDetailModel pokemonDetailModel) async {
    try {
      // Make the API request and receive the response
      PokemonDetailModel favoritePokemon = await ref
          .read(favoritePokemonServiceProvider)
          .toggleFavoriteItem(pokemonDetailModel: pokemonDetailModel);
      // Emit the Success state with the response data
      state = favoritePokemon;
      return favoritePokemon;
    } catch (_) {}
    return null;
  }
}

final addFavoritePokemonVM = StateNotifierProvider.autoDispose<
    AddFavoritePokemonViewModel, PokemonDetailModel>(
  (ref) => AddFavoritePokemonViewModel(ref),
);
