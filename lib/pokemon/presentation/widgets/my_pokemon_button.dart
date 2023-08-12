import 'package:flutter/material.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/pokemon_routes.dart';
import '../../../utils/theme/theme.dart';

class MyPokemonButton extends StatelessWidget {
  const MyPokemonButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, PokemonRoutes.myPokemonScreen);
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment.centerRight,
            backgroundColor: context.themeData.cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "My Pokemon",
            style: AppTextStyles.heading2Bold,
          )),
    );
  }
}
