import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/authentication/presentation/screens/login_screen.dart';
import '../onboarding/presentation/screens/splash_screen.dart';
import '../pokemon/presentation/screens/pokemon_home_screen.dart';
import '../my_pokemons/presentation/screens/my_pokemon_screen.dart';
import 'package:pokemon/favorites/presentation/screens/favorite_pokemon_screen.dart';

class PokemonRoutes {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/login';
  static const String pokemonHomeScreen = '/home';
  static const String pokemonFavoriteScreen = '/favorite';
  static const String myPokemonScreen = '/myPokemon';

  static Map<String, Widget Function(BuildContext)> routes = {};

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      case loginScreen:
        return CupertinoPageRoute(
            builder: (context) => const LoginScreen());
      case pokemonHomeScreen:
        return CupertinoPageRoute(
            builder: (context) => const PokemonHomeScreen());
        case pokemonFavoriteScreen:
        return CupertinoPageRoute(
            builder: (context) => const FavoritePokemonScreen());
        case myPokemonScreen:
        return CupertinoPageRoute(
            builder: (context) => const MyPokemonScreen());
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
