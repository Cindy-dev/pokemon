class DreamWorld {
  String? frontDefault;

  DreamWorld({
   this.frontDefault,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
    frontDefault: json["front_default"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
  };
}
