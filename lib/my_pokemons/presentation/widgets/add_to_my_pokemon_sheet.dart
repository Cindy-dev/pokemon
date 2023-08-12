import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: context.themeData.cardColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text("Hey")
              ],
            ),
          );
        },
      );
    },
  );
}
