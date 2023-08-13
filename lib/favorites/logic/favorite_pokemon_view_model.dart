import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/pokemon/data/model/pokemon_detail_model.dart';
import '../data/repository/favorite_pokemon_services.dart';
import 'favorite_pokemon_states.dart';

class FetchFavoritePokemonVM extends StateNotifier<FavoritePokemonState> {
  final Ref ref;
  FetchFavoritePokemonVM(this.ref) : super(const FavoritePokemonInitial());


  Stream<List<PokemonDetailModel>> fetchFavorite() {
    state = const FavoritePokemonLoading();
    try {
      final result =
          ref.read(favoritePokemonServiceProvider).getAllFavoritePokemon();
      state = FavoritePokemonLoaded(result);
      return result;
    } catch (e) {
      state = FavoritePokemonError(e.toString());
      rethrow;
    }
  }
}


final fetchFavoritePokemonVM = StreamProvider<List<PokemonDetailModel>>((ref) => FetchFavoritePokemonVM(ref).fetchFavorite());


