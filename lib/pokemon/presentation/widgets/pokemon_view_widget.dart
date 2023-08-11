import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/theme/theme.dart';
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
        color: context.themeData.primaryColorLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.colors.blue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (data.sprites != null)
            Flexible(
              child: SvgPicture.network(
                data.sprites!.other!.dreamWorld.frontDefault,
                fit: BoxFit.contain,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(data.name ?? "", style: AppTextStyles.headingSemiBold,),
          )
        ],
      ),
    );
  }
}
