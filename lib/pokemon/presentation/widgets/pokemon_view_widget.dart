import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/utils/app_extension.dart';
import '../../data/model/fetch_pokemon_model.dart';
import '../../logic/view_models/pokemon_detail_view_model.dart';

class PokemonViewWidget extends ConsumerWidget {
  const PokemonViewWidget({
    super.key,
    required this.pokemon,
  });

  final PokemonResult pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(pokemonDetailVM(pokemon));
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.colors.blue),
      ),
      child: Column(
        children: [
          if (data.sprites != null) Image.network(data.sprites!.frontDefault),
          Text(data.name ?? "")
        ],
      ),
    );
  }
}