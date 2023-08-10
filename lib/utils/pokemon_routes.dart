import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../onboarding/presentation/screens/splash_screen.dart';
import '../pokemon/presentation/screens/pokemon_home_screen.dart';

class PokemonRoutes {
  static const String splashScreen = '/splash';
  static const String pokemonHomeScreen = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {};

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      case pokemonHomeScreen:
        return CupertinoPageRoute(
            builder: (context) => const PokemonHomeScreen());
      // Default Route is error route
      default:
        return CupertinoPageRoute(
          builder: (context) => errorView(settings.name),
        );
    }
  }

  static Widget errorView(String? name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}