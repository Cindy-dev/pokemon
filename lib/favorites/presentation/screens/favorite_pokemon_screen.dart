import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/favorites/data/repository/favorite_pokemon_services.dart';
import 'package:pokemon/favorites/logic/favorite_pokemon_view_model.dart';
import 'package:pokemon/utils/app_extension.dart';
import '../../../utils/pokemon_loading_indicatior.dart';
import '../../../utils/theme/theme.dart';

class FavoritePokemonScreen extends ConsumerStatefulWidget {
  const FavoritePokemonScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FavoritePokemonScreen> createState() =>
      _FavoritePokemonScreenState();
}

class _FavoritePokemonScreenState extends ConsumerState<FavoritePokemonScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(fetchFavoritePokemonVM);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vm.when(
                data: (data) {
                  return data.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final favoritePokemonData = data[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.only(
                                                right: 14),
                                            height: context.deviceHeight() / 15,
                                            width: context.deviceWidth() / 4,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    favoritePokemonData.sprites!
                                                        .frontDefault!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            favoritePokemonData.name!.trim(),
                                            style:
                                                AppTextStyles.headingSemiBold,
                                          ),
                                          const SizedBox(height: 6),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: context.deviceWidth() / 17),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            ref
                                                .read(
                                                    favoritePokemonServiceProvider)
                                                .toggleFavoriteItem(
                                                    pokemonDetailModel:
                                                        favoritePokemonData);
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            size: 24,
                                            color: context.themeData.cardColor,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      : const Expanded(
                          child: Center(
                            child: Text("Favorite List is Empty",
                                style: AppTextStyles.headingSemiBold),
                          ),
                        );
                },
                error: (e, s) {
                  final error = vm.error.toString();
                  return Text(
                    error,
                    style: AppTextStyles.bodyMedium,
                  );
                },
                loading: () => pokemonLoadingIndicator(context))
          ],
        ),
      ),
    );
  }
}
