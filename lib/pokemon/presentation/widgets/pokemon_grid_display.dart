import 'package:flutter/cupertino.dart';
import 'package:pokemon/utils/app_extension.dart';
import '../../../utils/pokemon_loading_indicatior.dart';
import '../../../utils/theme/theme.dart';
import '../../data/model/fetch_pokemon_model.dart';

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
    return Expanded(
      child: Stack(
        children: [
          GridView.builder(
            controller: scrollController,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 20),
            itemCount: pokemonResult.length,
            itemBuilder: (context, index) {
              final pokemon = pokemonResult[index].name;
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: context.colors.blue),
                ),
                child: Text(pokemon ?? "", style: AppTextStyles.bodyMedium),
              );
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
}
