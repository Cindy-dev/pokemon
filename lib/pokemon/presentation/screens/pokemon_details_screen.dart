import 'package:flutter/material.dart';
import 'package:pokemon/pokemon/presentation/widgets/pokemon_details_header.dart';
import 'package:pokemon/pokemon/presentation/widgets/pokemon_details_widget.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/pokemon_loading_indicatior.dart';
import '../../data/model/pokemon_detail_model.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final PokemonDetailModel pokemonDetailModel;
  const PokemonDetailsScreen({Key? key, required this.pokemonDetailModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              pokemonDetailModel.sprites?.other!.officialArtwork.frontDefault ==
                      null
                  ? Container(
                      alignment: Alignment.center,
                      height: context.deviceHeight() / 2,
                      child: pokemonLoadingIndicator(context))
                  : Container(
                      height: context.deviceHeight() / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              pokemonDetailModel
                                  .sprites!.other!.officialArtwork.frontDefault,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
              PokemonDetailsWidget(pokemonDetailModel: pokemonDetailModel),
            ],
          ),
          PokemonDetailsHeader(
            title: "#${pokemonDetailModel.id ?? "0"}",
          ),
        ],
      ),
    );
  }
}
