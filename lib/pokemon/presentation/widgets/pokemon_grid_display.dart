import 'package:flutter/cupertino.dart';
import '../../data/model/fetch_pokemon_model.dart';
import '../../../utils/pokemon_loading_indicatior.dart';
import 'package:pokemon/pokemon/presentation/widgets/pokemon_view_widget.dart';

class PokemonGridDisplay extends StatelessWidget {
  final String searchText;
  final List<PokemonResult> pokemonResult;
  final ScrollController scrollController;
  bool isLoadMore;
  PokemonGridDisplay(
      {Key? key,
      required this.pokemonResult,
      this.isLoadMore = false,
      required this.scrollController,
      required this.searchText})
      : super(key: key);


  //created a new list for filtered result, this holds the filter data
  List<PokemonResult> filteredPokemonResult = [];

  @override
  Widget build(BuildContext context) {
    filterPokemon();
    // checking if the filtered list is empty to return a not found text
    if (filteredPokemonResult.isEmpty) {
      return const Center(child: Text("Pokemon name not found"));
    }
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          GridView.builder(
            controller: scrollController,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 20),
            itemCount: filteredPokemonResult.length,
            itemBuilder: (context, index) {
              final pokemon = filteredPokemonResult[index];
              return PokemonViewWidget(pokemon: pokemon);
            },
          ),
          if (isLoadMore)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: pokemonLoadingIndicator(context),
            ),
        ],
      ),
    );
  }

  void filterPokemon() {
    //if search text is not empty filter the pokemon data and assign it to the
    //filtered pokemon result else filtered pokemon result should be same with the main result
    if (searchText.isNotEmpty) {
      filteredPokemonResult = pokemonResult
          .where((pokemon) =>
              pokemon.name!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    } else {
      filteredPokemonResult = pokemonResult;
    }
  }
}
