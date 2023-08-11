import 'package:flutter/material.dart';
import 'package:pokemon/utils/app_extension.dart';
import '../../../utils/theme/theme.dart';

class PokemonSearchField extends StatefulWidget {
  final TextEditingController searchController;
  void Function(String)? onChanged;
 PokemonSearchField({Key? key, required this.searchController, this.onChanged})
      : super(key: key);

  @override
  State<PokemonSearchField> createState() => _PokemonSearchFieldState();
}

class _PokemonSearchFieldState extends State<PokemonSearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "search item cannot be empty";
          }
          return null;
        },
        onChanged: widget.onChanged,
        controller: widget.searchController,
        cursorColor: context.themeData.cardColor,
        style: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
        decoration: InputDecoration(
          hintText: "search for pokemons",
          hintStyle: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: context.themeData.colorScheme.error),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: context.themeData.cardColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: context.themeData.cardColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: context.themeData.cardColor),
          ),
        ),
      ),
    );
  }
}
