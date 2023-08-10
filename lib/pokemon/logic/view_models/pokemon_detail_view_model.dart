import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/pokemon/data/model/fetch_pokemon_model.dart';
import 'package:pokemon/pokemon/data/model/pokemon_detail_model.dart';
import 'package:pokemon/pokemon/data/repository/fetch_pokemon_services.dart';

class PokemonDetailViewModel extends StateNotifier<PokemonDetailModel> {
  final Ref ref;
  PokemonResult pokemonResult;
  PokemonDetailViewModel(this.ref, this.pokemonResult)
      : super(PokemonDetailModel(name: pokemonResult.name)) {
    fetchPokemonDetails();
  }

  Future<PokemonDetailModel?> fetchPokemonDetails() async {
    try {
      // Make the API request and receive the response
      PokemonDetailModel detail = await ref
          .read(fetchPokemonServices)
          .fetchPokemonDetails(name: pokemonResult.name ?? "");
      // Emit the Success state with the response data
      state = detail;
      return detail;
    } catch (_) {}
    return null;
  }
}

final pokemonDetailVM = StateNotifierProvider.family<PokemonDetailViewModel,
    PokemonDetailModel, PokemonResult>(
  (ref, result) => PokemonDetailViewModel(ref, result),
);
