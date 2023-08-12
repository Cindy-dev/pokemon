import 'package:flutter/material.dart';
import 'package:pokemon/my_pokemons/presentation/widgets/my_pokemon_form_widget.dart';
import 'package:pokemon/utils/app_extension.dart';

addToMyPokemonModalSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (_) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (BuildContext context, scrollController) {
          return Container(
            height: context.deviceHeight() / 1.5,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            decoration: BoxDecoration(
              color: context.themeData.cardColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: MyPokemonFormWidget(
            ),
          );
        },
      );
    },
  );
}
