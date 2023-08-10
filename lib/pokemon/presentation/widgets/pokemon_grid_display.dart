import 'package:flutter/cupertino.dart';
import '../../data/model/fetch_pokemon_model.dart';
import '../../../utils/pokemon_loading_indicatior.dart';
import 'package:pokemon/pokemon/presentation/widgets/pokemon_view_widget.dart';

class PokemonGridDisplay extends StatelessWidget {
  final List<PokemonResult> pokemonResult;
  final ScrollController scrollController;
  bool isLoadMore;
  PokemonGridDisplay(
      {Key? key,
      required this.pokemonResult,
      this.isLoadMore = false,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          controller: scrollController,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 20),
          itemCount: pokemonResult.length,
          itemBuilder: (context, index) {
            final pokemon = pokemonResult[index];
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
    );
  }
}
