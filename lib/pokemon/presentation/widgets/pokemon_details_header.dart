import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/favorites/data/repository/favorite_pokemon_services.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/theme/theme.dart';
import '../../../favorites/logic/add_favorite_pokemon_view_model.dart';
import '../../data/model/pokemon_detail_model.dart';

class PokemonDetailsHeader extends StatefulWidget {
  final PokemonDetailModel pokemonDetailModel;
  const PokemonDetailsHeader({Key? key, required this.pokemonDetailModel})
      : super(key: key);

  @override
  State<PokemonDetailsHeader> createState() => _PokemonDetailsHeaderState();
}

class _PokemonDetailsHeaderState extends State<PokemonDetailsHeader> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: context.themeData.cardColor,
              ),
            ),
            Text(
              "#${widget.pokemonDetailModel.pokemonId.toString()}",
              style: AppTextStyles.headingBold,
            ),
            Consumer(
              builder: (_, ref, child) {
                ref.watch(addFavoritePokemonVM);
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    ref
                        .read(addFavoritePokemonVM.notifier)
                        .addFavoritePokemon(widget.pokemonDetailModel);
                    setState(() {});
                  },
                  child: FutureBuilder<bool>(
                    future: ref
                        .watch(favoritePokemonServiceProvider)
                        .existingItemFave(widget.pokemonDetailModel.name ?? ""),
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
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
                          color: appTheme.cardColor,
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
