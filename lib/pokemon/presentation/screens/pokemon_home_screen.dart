import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/favorites/presentation/screens/favorite_pokemon_screen.dart';
import 'package:pokemon/pokemon/logic/pokemon_states.dart';
import 'package:pokemon/pokemon/logic/view_models/fetch_pokemon_view_model.dart';
import 'package:pokemon/pokemon/presentation/widgets/pokemon_grid_display.dart';
import 'package:pokemon/pokemon/presentation/widgets/pokemon_search_field.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/pokemon_loading_indicatior.dart';
import 'package:pokemon/utils/theme/theme.dart';

class PokemonHomeScreen extends ConsumerStatefulWidget {
  const PokemonHomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PokemonHomeScreen> createState() => _PokemonHomeScreenState();
}

class _PokemonHomeScreenState extends ConsumerState<PokemonHomeScreen> {
  String _searchText = '';
  final scrollController = ScrollController();
  final searchController = TextEditingController();
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
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: context.colors.yellow,
                labelStyle: AppTextStyles.headingSemiBold
                    .copyWith(color: context.colors.yellow, fontSize: 13),
                unselectedLabelStyle: AppTextStyles.bodySemiBold
                    .copyWith(color: context.themeData.cardColor, fontSize: 13),
                unselectedLabelColor: context.themeData.cardColor,
                tabs: const [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Pokemons"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Favorite"),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Column(
                        children: [
                          PokemonSearchField(
                            searchController: searchController,
                            onChanged: (string) {
                              setState(
                                () {
                                  _searchText = searchController.text.trim();
                                },
                              );
                            },
                          ),
                          Consumer(
                            builder: (_, ref, child) {
                              final vm = ref.watch(fetchPokemonVM);
                              if (vm is PokemonLoadingState) {
                                return pokemonLoadingIndicator(context);
                              }
                              if (vm is FetchPokemonLoadedState) {
                                final items = vm.results!;
                                return PokemonGridDisplay(
                                    searchText: _searchText,
                                    pokemonResult: items,
                                    scrollController: scrollController);
                              }
                              if (vm is FetchPokemonLoadMoreState) {
                                final items = vm.results!;
                                return PokemonGridDisplay(
                                  searchText: _searchText,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(e.toString(),
                                            style: AppTextStyles.bodyMedium),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextButton(
                                        onPressed: () => ref
                                            .read(fetchPokemonVM.notifier)
                                            .fetchPokemon(),
                                        style: TextButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            backgroundColor:
                                                context.themeData.cardColor),
                                        child: const Text("Retry"),
                                      )
                                    ],
                                  ),
                                );
                              }
                              return const Center(
                                child: Text("An error occurred"),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const FavoritePokemonScreen()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 10),
        child: FloatingActionButton(

          backgroundColor: context.themeData.cardColor,
          onPressed: () {},
          child: Icon(Icons.add, color: context.primaryColor,),
        ),
      ),
    );
  }
}
