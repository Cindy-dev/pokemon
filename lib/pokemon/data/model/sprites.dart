import 'package:isar/isar.dart';
import 'other.dart';
part 'sprites.g.dart';

@embedded
class Sprites {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  @ignore
  Other? other;
  @ignore
  Sprites? animated;

  Sprites({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.other,
    this.animated,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
        animated: json["animated"] == null
            ? null
            : Sprites.fromJson(json["animated"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "other": other?.toJson(),
        "animated": animated?.toJson(),
      };
}
