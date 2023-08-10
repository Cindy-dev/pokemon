import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/pokemon/logic/pokemon_states.dart';
import 'package:pokemon/pokemon/logic/view_models/fetch_pokemon_view_model.dart';
import 'package:pokemon/pokemon/presentation/widgets/pokemon_grid_display.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/pokemon_loading_indicatior.dart';
import 'package:pokemon/utils/theme/theme.dart';

class PokemonHomeScreen extends ConsumerStatefulWidget {
  const PokemonHomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PokemonHomeScreen> createState() => _PokemonHomeScreenState();
}

class _PokemonHomeScreenState extends ConsumerState<PokemonHomeScreen> {
  final scrollController = ScrollController();
  @override
  void initState() {
    // Scheduling the fetchPokemon request function to run as soon as possible.
    Future.microtask(() => ref.read(fetchPokemonVM.notifier).fetchPokemon());
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        ref.read(fetchPokemonVM.notifier).fetchPokemon();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Consumer(
            builder: (_, ref, child) {
              final vm = ref.watch(fetchPokemonVM);
              if (vm is PokemonLoadingState) {
                return pokemonLoadingIndicator(context);
              }
              if (vm is FetchPokemonLoadedState) {
                final items = vm.results!;
                return PokemonGridDisplay(
                    pokemonResult: items, scrollController: scrollController);
              }
              if (vm is FetchPokemonLoadMoreState) {
                final items = vm.results!;
                return PokemonGridDisplay(
                  pokemonResult: items,
                  scrollController: scrollController,
                  isLoadMore: true,
                );
              }
              if (vm is PokemonErrorState) {
                final e = vm.error.toString();
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child:
                            Text(e.toString(), style: AppTextStyles.bodyMedium),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () =>
                            ref.read(fetchPokemonVM.notifier).fetchPokemon(),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: context.themeData.cardColor),
                        child: const Text("Retry"),
                      )
                    ],
                  ),
                );
              }
              return const Center(
                child: Text("No Data Found"),
              );
            },
          ),
        ),
      ),
    );
  }
}
