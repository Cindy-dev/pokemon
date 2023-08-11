import 'package:flutter/material.dart';
import 'package:pokemon/pokemon/data/model/pokemon_detail_model.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/theme/theme.dart';

class PokemonDetailsWidget extends StatelessWidget {
  final PokemonDetailModel pokemonDetailModel;
  const PokemonDetailsWidget({Key? key, required this.pokemonDetailModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          pokemonDetailModel.name ?? "",
          style: AppTextStyles.displayLarge.copyWith(fontSize: 30),
        ),
        if(pokemonDetailModel.types != null)
        Row(
          //using the map function to extract the name property from each Type object
          //then convert the mapped iterable into a list of widgets using toList
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          pokemonDetailModel.types!.map((type) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                  color: context.colors.yellow,
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                type.type.name ?? "",
                style: AppTextStyles.heading2Bold.copyWith(
                    fontSize: 20, color: context.themeData.colorScheme.error),
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  //dividing by 10 to convert from hectogram to kilogram
                  "${pokemonDetailModel.weight ?? 0 / 10}kg",
                  style: AppTextStyles.displayLarge.copyWith(fontSize: 30),
                ),
                const Text(
                  "Weight",
                  style: AppTextStyles.bodyMedium,
                ),
              ],
            ),
            const SizedBox(width: 30),
            Column(
              children: [
                Text(
                  //dividing by 10 to convert from decimeter to meters
                  "${pokemonDetailModel.height ?? 0  / 10}m",
                  style: AppTextStyles.displayLarge.copyWith(fontSize: 30),
                ),
                const Text(
                  "Height",
                  style: AppTextStyles.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
