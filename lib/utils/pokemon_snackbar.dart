import 'package:flutter/material.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/theme/theme.dart';

pokemonSnackBar({required String error, required BuildContext context}) {
  return SnackBar(
    backgroundColor: context.themeData.cardColor,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
    behavior: SnackBarBehavior.fixed,
    content: Text(error,
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyMedium.copyWith(color: context.primaryColor)),
    duration: const Duration(seconds: 3),
  );
}
