import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/utils/app_extension.dart';

pokemonLoadingIndicator(BuildContext context) {
  if (Platform.isIOS) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: CupertinoActivityIndicator(
        radius: 20,
        color: context.themeData.cardColor,
      ),
    );
  } else {
    Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: CircularProgressIndicator(color: context.themeData.cardColor),
    );
  }
}

pokemonLinearProgressIndicator(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: LinearProgressIndicator(
      color: context.primaryColor,
    ),
  );
}
