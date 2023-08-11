import 'package:pokemon/favorites/data/model/favorite_pokemon_db.dart';
import 'package:pokemon/pokemon/data/model/pokemon_detail_model.dart';

abstract class FavoritePokemonState {
  const FavoritePokemonState();
}

class FavoritePokemonInitial extends FavoritePokemonState {
  const FavoritePokemonInitial();
}

class FavoritePokemonLoading extends FavoritePokemonState {
  const FavoritePokemonLoading();
}

class FavoritePokemonAdded extends FavoritePokemonState {
  final PokemonDetailModel pokemonDetailModel;
  FavoritePokemonAdded(this.pokemonDetailModel);
}

class FavoritePokemonLoaded extends FavoritePokemonState {
  final Stream<List<FavoritePokemonDB>> favoritePokemons;
  FavoritePokemonLoaded(this.favoritePokemons);
}

class FavoritePokemonError extends FavoritePokemonState {
  final String error;
  const FavoritePokemonError(this.error);
}