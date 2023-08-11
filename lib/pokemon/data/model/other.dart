import 'dreamworld.dart';
import 'official_artwork.dart';

class Other {
  DreamWorld? dreamWorld;
  OfficialArtwork? officialArtwork;

  Other({
  this.dreamWorld,
  this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    dreamWorld: DreamWorld.fromJson(json["dream_world"]),
    officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
  );

  Map<String, dynamic> toJson() => {
    "dream_world": dreamWorld?.toJson(),
    "official-artwork": officialArtwork?.toJson(),
  };
}
