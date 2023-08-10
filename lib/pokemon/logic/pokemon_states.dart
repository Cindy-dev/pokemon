import 'package:pokemon/pokemon/data/model/fetch_pokemon_model.dart';

abstract class PokemonStates {
  const PokemonStates();
}

class PokemonInitialState extends PokemonStates {
  const PokemonInitialState();
}

class PokemonLoadingState extends PokemonStates {
  const PokemonLoadingState();
}

class FetchPokemonLoadedState extends PokemonStates {
  final FetchPokemonModel fetchPokemonModel;
  const FetchPokemonLoadedState(this.fetchPokemonModel);
}

class PokemonErrorState extends PokemonStates {
  final String error;
  const PokemonErrorState(this.error);
}
