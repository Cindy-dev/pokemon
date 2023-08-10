import 'dart:io';

import 'package:dio/dio.dart';

class PokemonDioException implements Exception {
  final String errorDescription;
  final dynamic data;
  final DioExceptionType? dioExceptionType;
  int? statusCode;
  static const unknownError = 'Something went wrong, please try again';
  static const internetError = 'Internet connection error, please try again';
  static const cancelError = 'API request canceled, please try again';
  static const internetError2 =
      'Please check your internet connection , seems you are offline';

  PokemonDioException({
    required this.errorDescription,
    this.data,
    this.dioExceptionType,
    this.statusCode,
  });

  factory PokemonDioException.fromDioError(DioException error) {
    try {
      String description = '';
      switch (error.type) {
        case DioExceptionType.badCertificate:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          description = unknownError;
          break;
        case DioExceptionType.badResponse:
          description = extractDescriptionFromResponse(error.response);
          break;
        case DioExceptionType.cancel:
          description = cancelError;
          break;
        case DioExceptionType.unknown:
        case DioExceptionType.connectionError:
          description = unknownError;
          if (error.error is SocketException) {
            description = internetError;
          } else {
            description = unknownError;
          }
          break;
      }
      return PokemonDioException(
        errorDescription: description,
        dioExceptionType: error.type,
        data:
        error.response?.data != null ? error.response?.data['data'] : null,
        statusCode: error.response?.statusCode,
      );
    } catch (_) {
      throw unknownError;
    }
  }

  static String extractDescriptionFromResponse(Response? response) {
    try {
      if (response!.statusCode! >= 500) {
        return 'Internal Server error, please try again later';
      }
      if (response.data != null && response.data['message'] != null) {
        return response.data['message'] as String;
      } else {
        return response.statusMessage ?? '';
      }
    } catch (error) {
      throw unknownError;
    }
  }

  @override
  String toString() => errorDescription;
}
