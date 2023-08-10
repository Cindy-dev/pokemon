import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/pokemon/data/model/fetch_pokemon_model.dart';
import 'package:pokemon/pokemon/data/pokemon_dio_exception.dart';

class FetchPokemonServices{
  final Dio dio = Dio();

  Future<FetchPokemonModel> fetchPokemon() async {
    const url = "https://pokeapi.co/api/v2/pokemon/";
    try {
      final result = await dio.get(url);
      print(result);
      final responseModel = FetchPokemonModel.fromJson(result.data);
      return responseModel;
    } on DioException catch (error, stackTrace) {
      final apiError = PokemonDioException.fromDioError(error);
      return Future.error(apiError, stackTrace);
    } catch (_) {
      rethrow;
    }
  }

}

final fetchPokemonServices = Provider((ref) => FetchPokemonServices());