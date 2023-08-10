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
  final  List<PokemonResult>? results;
  const FetchPokemonLoadedState(this.results);
}

class FetchPokemonLoadMoreState extends PokemonStates {
  final  List<PokemonResult>? results;
  const FetchPokemonLoadMoreState(this.results);
}

class PokemonErrorState extends PokemonStates {
  final String error;
  const PokemonErrorState(this.error);
}
