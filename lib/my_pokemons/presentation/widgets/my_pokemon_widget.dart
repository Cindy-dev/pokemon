import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/my_pokemons/data/data/model/my_pokemons_model.dart';
import 'package:pokemon/my_pokemons/data/repository/my_pokemons_service.dart';
import 'package:pokemon/utils/app_extension.dart';
import '../../../utils/theme/theme.dart';

class MyPokemonWidget extends StatelessWidget {
  final MyPokemonModel myPokemonData;
  const MyPokemonWidget({Key? key, required this.myPokemonData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myPokemonData.name!.trim(),
                        style: AppTextStyles.headingSemiBold
                            .copyWith(color: context.primaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          //dividing by 10 to convert from hectogram to kilogram
                          "Weight: ${myPokemonData.weight! / 10}kg",
                          style: AppTextStyles.bodySemiBold,
                        ),
                      ),
                      Text(
                        //dividing by 10 to convert from hectogram to kilogram
                        "Height: ${myPokemonData.height! / 10}m",
                        style: AppTextStyles.bodySemiBold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (myPokemonData.types != null)
                        Row(
                          children: [
                            const Text(
                              //dividing by 10 to convert from hectogram to kilogram
                              "Pokemon Type: ",
                              style: AppTextStyles.heading2Bold,
                            ),
                            Row(
                              //using the map function to extract the name property from each Type object
                              //then convert the mapped iterable into a list of widgets using toList
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: myPokemonData.types!.map((type) {
                                return FittedBox(
                                  child: Text(
                                    type,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodySemiBold,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                    ],
                  ),
                  Consumer(builder: (_, ref, child) {
                    return IconButton(
                        onPressed: () {
                          ref
                              .read(myPokemonServiceProvider)
                              .deleteMyPokemon(myPokemonData.id);
                        },
                        icon: const Icon(Icons.delete));
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
