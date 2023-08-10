import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/pokemon/data/model/fetch_pokemon_model.dart';
import 'package:pokemon/pokemon/data/repository/fetch_pokemon_services.dart';
import 'package:pokemon/pokemon/logic/pokemon_states.dart';

class FetchPokemonViewModel extends StateNotifier<PokemonStates> {
  int page = 0;
  int limit = 20;
  List<PokemonResult> pokemonData = [];
  final Ref ref;
  FetchPokemonViewModel(this.ref) : super(const PokemonInitialState());

  Future<List<PokemonResult>?> fetchPokemon() async {
    if (pokemonData.isEmpty) {
      state = const PokemonLoadingState();
    } else {
      state = FetchPokemonLoadMoreState(pokemonData);
    }
    try {
      //creating query parameters for the request
      Map<String, dynamic> queryParam = {
        "offset": page * limit,
        "limit": limit
      };
      // Make the API request and receive the response
      final response =
          await ref.read(fetchPokemonServices).fetchPokemon(queryParam);
      pokemonData.addAll(response.results!);
      final data = response.results;
      // Emit the Success state with the response data
      state = FetchPokemonLoadedState(pokemonData);
      page = page + 1;
      return data;
    } catch (error) {
      // Handle the error...
      state = PokemonErrorState(error.toString());
      rethrow;
    }
  }
}

final fetchPokemonVM =
    StateNotifierProvider.autoDispose<FetchPokemonViewModel, PokemonStates>(
        (ref) => FetchPokemonViewModel(ref));
