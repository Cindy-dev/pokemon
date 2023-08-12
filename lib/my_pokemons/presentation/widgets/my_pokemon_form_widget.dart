import 'package:flutter/material.dart';
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
              labelText: "Pokemon Weight (Kg)"),
          const SizedBox(
            height: 15,
          ),
          PokemonTextField(
              controller: _heightController,
              hintText: "Input your pokemon height",
              labelText: "Pokemon Height (M)"),
        ],
      ),
    );
  }
}
