import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/favorites/logic/favorite_pokemon_view_model.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/theme/theme.dart';

class PokemonDetailsHeader extends StatelessWidget {
  VoidCallback? favoriteButtonTap;
  final String title;
  final String pokemonName;
  PokemonDetailsHeader(
      {Key? key,
      required this.title,
      this.favoriteButtonTap,
      required this.pokemonName})
      : super(key: key);

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
              title,
              style: AppTextStyles.headingBold,
            ),
            Consumer(builder: (_, ref, child) {
              final isExisting = ref
                  .watch(checkPokemonExistenceVM(pokemonName));
             return isExisting.when(data: (data){
                return data ?  InkWell(
                  onTap: favoriteButtonTap,
                  child: Icon(Icons.favorite_outline,
                      color: context.themeData.cardColor),
                ) : InkWell(
                  onTap: favoriteButtonTap,
                  child: Icon(Icons.favorite,
                      color: context.themeData.cardColor),
                );
              }, error: (e,s){
               return Container();
             }, loading: (){
               return Container();
             } );
            })
          ],
        ),
      ),
    );
  }
}
