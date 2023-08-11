import 'package:flutter/material.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/theme/theme.dart';

class PokemonDetailsHeader extends StatelessWidget {
  final String title;
  const PokemonDetailsHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: context.themeData.cardColor,
              ),
            ),
            Text(
              title,
              style: AppTextStyles.headingBold,
            ),
            Icon(Icons.favorite_outline, color: context.themeData.cardColor)
          ],
        ),
      ),
    );
  }
}
