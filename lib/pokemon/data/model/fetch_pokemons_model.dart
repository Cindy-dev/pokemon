class FetchPokemonModel {
  int? count;
  String? next;
  dynamic previous;
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
        previous: json["previous"],
        results: List<PokemonResult>.from(
            json["data"].map((x) => PokemonResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
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
