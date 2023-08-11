class Detail{
   String? name;
   String? url;

  Detail({
   this.name,
    this.url,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
