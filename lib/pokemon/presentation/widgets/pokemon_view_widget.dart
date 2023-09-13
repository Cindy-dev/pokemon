import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/pokemon/presentation/screens/pokemon_details_screen.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/theme/theme.dart';
import '../../../favorites/data/repository/favorite_pokemon_services.dart';
import '../../../favorites/logic/add_favorite_pokemon_view_model.dart';
import '../../data/model/fetch_pokemon_model.dart';
import '../../logic/view_models/pokemon_detail_view_model.dart';

class PokemonViewWidget extends ConsumerStatefulWidget {
  const PokemonViewWidget({
    super.key,
    required this.pokemon,
  });

  final PokemonResult pokemon;

  @override
  ConsumerState<PokemonViewWidget> createState() => _PokemonViewWidgetState();
}

class _PokemonViewWidgetState extends ConsumerState<PokemonViewWidget> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final data = ref.watch(pokemonDetailVM(widget.pokemon));
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.themeData.primaryColorLight,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: context.colors.blue),
          ),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) {
                  return PokemonDetailsScreen(pokemonDetailModel: data);
                },
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (data.sprites != null)
                  Flexible(
                    child: SvgPicture.network(
                      data.sprites!.other!.dreamWorld!.frontDefault!,
                      fit: BoxFit.contain,
                    ),
                  ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    data.name ?? "",
                    style: AppTextStyles.headingSemiBold,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Consumer(builder: (_, ref, child) {
            return IconButton(
                onPressed: () {
                  //either add or remove
                  ref
                      .read(addFavoritePokemonVM.notifier)
                      .addFavoritePokemon(data);
                  setState(() {});
                },
                //Icon(Icons.favorite_outline),
                icon: FutureBuilder<bool>(
                  future: ref
                      .watch(favoritePokemonServiceProvider)
                      .existingItemFave(data.name ?? ""),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Icon(
                        Icons.favorite_border_outlined,
                        size: 30,
                        color: appTheme.cardColor,
                      );
                    } else if (snapshot.hasData) {
                      return snapshot.data!
                          ? Icon(
                            Icons.favorite_border_outlined,
                            size: 30,
                            color: context.themeData.cardColor,
                          )
                          : Icon(Icons.favorite,
                              size: 30, color: context.themeData.cardColor);
                    } else {
                      return Icon(
                        Icons.favorite_border_outlined,
                        size: 30,
                        color: context.themeData.cardColor,
                      );
                    }
                  },
                ));
          }),
        ),
      ],
    );
  }
}
