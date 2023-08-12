import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/utils/pokemon_routes.dart';
import 'package:pokemon/utils/theme/theme.dart';
import 'favorites/data/repository/isar_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.initialize();
  runApp(const ProviderScope(child: MyApp()));
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
