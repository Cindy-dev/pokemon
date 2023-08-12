import 'package:flutter/material.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/theme/theme.dart';

class PokemonButton extends StatelessWidget {
  final Color? buttonColor;
  final String buttonText;
  final VoidCallback? buttonTap;
  PokemonButton(
      {Key? key,
        this.buttonColor,
        required this.buttonText,
        this.buttonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 24),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: buttonColor ?? context.primaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          buttonText,
          style: AppTextStyles.heading2Bold
              .copyWith(color: context.themeData.cardColor, height: 1.7),
        ),
      ),
    );
  }
}
