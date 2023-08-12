import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/my_pokemons/logic/my_pokemon_states.dart';
import 'package:pokemon/my_pokemons/logic/my_pokemon_view_model.dart';
import 'package:pokemon/utils/pokemon_button.dart';
import 'package:pokemon/utils/pokemon_loading_indicatior.dart';
import 'package:pokemon/utils/pokemon_snackbar.dart';
import 'package:pokemon/utils/pokemon_textfield.dart';

class MyPokemonFormWidget extends StatefulWidget {
  const MyPokemonFormWidget({Key? key}) : super(key: key);

  @override
  State<MyPokemonFormWidget> createState() => _MyPokemonFormWidgetState();
}

class _MyPokemonFormWidgetState extends State<MyPokemonFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _spriteUrlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          PokemonTextField(
              controller: _nameController,
              hintText: "Input your pokemon name",
              labelText: "Pokemon Name"),
          const SizedBox(
            height: 15,
          ),
          PokemonTextField(
              controller: _weightController,
              hintText: "Input your pokemon weight",
              labelText: "Pokemon Weight (Hectograms)"),
          const SizedBox(
            height: 15,
          ),
          PokemonTextField(
              controller: _heightController,
              hintText: "Input your pokemon height",
              labelText: "Pokemon Height (Decimeters)"),
          const SizedBox(
            height: 15,
          ),
          PokemonTextField(
              controller: _spriteUrlController,
              hintText: "Input your pokemon image url",
              labelText: "Pokemon Image Link"),
          const SizedBox(
            height: 15,
          ),
          PokemonTextField(
              controller: _typeController,
              hintText: "Input your pokemon type e.g (grass, poison)",
              labelText: "Pokemon Type"),
          Consumer(
            builder: (_, ref, child) {
              final vm = ref.watch(myPokemonVM);
              ref.listen(
                myPokemonVM,
                (previous, nextState) {
                  if (nextState is MyPokemonSuccessState) {
                    Navigator.pop(context);
                  }
                  if (nextState is MyPokemonErrorState) {
                    final error = nextState.error.toString();
                     pokemonSnackBar(error: error, context: context);
                  }
                },
              );
              if (vm is MyPokemonLoadingState) {
                return pokemonLoadingIndicator(context);
              } else {
                return PokemonButton(
                  buttonText: "Create my pokemon",
                  buttonTap: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    //initializing an empty list
                    List<String> items = [];
                    //splitting the data from the text field
                    final List<String> newTypes =
                        _typeController.text.split(',');
                    //assigning the split data to the empty list
                    items.addAll(newTypes);
                    ref.read(myPokemonVM.notifier).createMyPokemon(
                        name: _nameController.text,
                        height: int.parse(_heightController.text),
                        spriteUrl: _spriteUrlController.text,
                        weight: int.parse(_weightController.text),
                        types: items);
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }
}
