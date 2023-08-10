import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/pokemon/data/model/fetch_pokemon_model.dart';
import 'package:pokemon/pokemon/data/repository/fetch_pokemon_services.dart';
import 'package:pokemon/pokemon/logic/pokemon_states.dart';

class FetchPokemonViewModel extends StateNotifier<PokemonStates> {
  final Ref ref;
  FetchPokemonViewModel(this.ref) : super(const PokemonInitialState());

  Future<FetchPokemonModel> fetchPokemon() async {
    state = const PokemonLoadingState();
    try {
      // Make the API request and receive the response
      final response = await ref.read(fetchPokemonServices).fetchPokemon();

      // Emit the Success state with the response data
      state = FetchPokemonLoadedState(response);
      return response;
    } catch (error) {
      // Handle the error...
      state = PokemonErrorState(error.toString());
      rethrow;
    }
  }
}

final fetchPokemonVM = FutureProvider.autoDispose(
    (ref) => FetchPokemonViewModel(ref).fetchPokemon());
