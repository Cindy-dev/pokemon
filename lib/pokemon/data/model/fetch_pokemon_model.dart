import 'package:equatable/equatable.dart';

class FetchPokemonModel extends Equatable {
  int? count;
  String? next;
  String? previous;
  List<PokemonResult>? results;

  FetchPokemonModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory FetchPokemonModel.fromJson(Map<String, dynamic> json) =>
      FetchPokemonModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"] == null ? null : json["previous"],
        results: List<PokemonResult>.from(
            json["results"]?.map((x) => PokemonResult.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous == null ? null : previous,
        "results": List<PokemonResult>.from(results!.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [results, count, next, previous];
}

class PokemonResult {
  String? name;
  String? url;

  PokemonResult({
    this.name,
    this.url,
  });

  factory PokemonResult.fromJson(Map<String, dynamic> json) => PokemonResult(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
