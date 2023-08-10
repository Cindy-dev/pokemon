import 'package:flutter/material.dart';
import 'package:pokemon/utils/pokemon_routes.dart';
import 'package:pokemon/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
        routes: PokemonRoutes.routes,
        initialRoute: PokemonRoutes.splashScreen,
        onGenerateRoute: PokemonRoutes.generateRoute,
    );
  }
}
