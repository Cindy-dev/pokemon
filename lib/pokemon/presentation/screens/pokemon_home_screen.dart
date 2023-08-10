import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/pokemon/logic/view_models/fetch_pokemon_view_model.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/pokemon_loading_indicatior.dart';
import 'package:pokemon/utils/theme/theme.dart';

class PokemonHomeScreen extends StatefulWidget {
  const PokemonHomeScreen({Key? key}) : super(key: key);

  @override
  State<PokemonHomeScreen> createState() => _PokemonHomeScreenState();
}

class _PokemonHomeScreenState extends State<PokemonHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
           // shrinkWrap: true,
            children: [
              Consumer(
                builder: (_, ref, child) {
                  final vm = ref.watch(fetchPokemonVM);
                  return vm.when(
                    data: (data) {
                      return Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 20),
                          itemCount: data.results!.length,
                          itemBuilder: (context, index) {
                            final pokemon = data.results?[index].name;
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: context.colors.blue),
                              ),
                              child: Text(pokemon ?? "",
                                  style: AppTextStyles.bodyMedium),
                            );
                          },
                        ),
                      );
                    },
                    error: (e, s) {
                      return Column(
                        children: [
                          Text(e.toString(), style: AppTextStyles.bodyMedium)
                        ],
                      );
                    },
                    loading: () => pokemonLoadingIndicator(context),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
