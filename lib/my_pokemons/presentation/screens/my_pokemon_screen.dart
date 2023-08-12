import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/my_pokemons/presentation/widgets/my_pokemon_widget.dart';
import 'package:pokemon/utils/app_extension.dart';
import '../../../utils/pokemon_loading_indicatior.dart';
import '../../../utils/theme/theme.dart';
import '../../logic/my_pokemon_view_model.dart';

class MyPokemonScreen extends ConsumerWidget {
  const MyPokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(fetchMyPokemonVM);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "My Pokemons",
          style:
              AppTextStyles.displayLarge.copyWith(color: context.primaryColor),
        ),
      ),
      body: SafeArea(
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
                                final myPokemonData = data[index];
                                return MyPokemonWidget(
                                  myPokemonData: myPokemonData,
                                );
                              },
                            ),
                          )
                        : const Expanded(
                            child: Center(
                              child: Text("Your Pokemon List is Empty",
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
      ),
    );
  }
}
