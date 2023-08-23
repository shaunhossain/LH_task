import 'dart:convert';

SponsorResponse sponsorResponseFromJson(String str) => SponsorResponse.fromJson(jsonDecode(str));

String sponsorResponseToJson(SponsorResponse data) => json.encode(data.toJson());

class SponsorResponse {
  final SponsorData? data;

  SponsorResponse({
    this.data,
  });

  factory SponsorResponse.fromJson(Map<String, dynamic> json) => SponsorResponse(
    data: json["data"] == null ? null : SponsorData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class SponsorData {
  final List<Sponsor>? sponsors;

  SponsorData({
    this.sponsors,
  });

  factory SponsorData.fromJson(Map<String, dynamic> json) => SponsorData(
    sponsors: json["sponsors"] == null ? [] : List<Sponsor>.from(json["sponsors"]!.map((x) => Sponsor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sponsors": sponsors == null ? [] : List<dynamic>.from(sponsors!.map((x) => x.toJson())),
  };
}

class Sponsor {
  final String? name;
  final List<Type>? type;
  final Image? image;

  Sponsor({
    this.name,
    this.type,
    this.image,
  });

  factory Sponsor.fromJson(Map<String, dynamic> json) => Sponsor(
    name: json["name"],
    type: json["type"] == null ? [] : List<Type>.from(json["type"]!.map((x) => typeValues.map[x]!)),
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type == null ? [] : List<dynamic>.from(type!.map((x) => typeValues.reverse[x])),
    "image": image?.toJson(),
  };
}

class Image {
  final String? url;

  Image({
    this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

enum Type {
  BRONZE_SPONSOR,
  GOLD_SPONSOR,
  ORGANIZER,
  SILVER_SPONSOR,
  SPONSOR
}

final typeValues = EnumValues({
  "BRONZE_SPONSOR": Type.BRONZE_SPONSOR,
  "GOLD_SPONSOR": Type.GOLD_SPONSOR,
  "ORGANIZER": Type.ORGANIZER,
  "SILVER_SPONSOR": Type.SILVER_SPONSOR,
  "SPONSOR": Type.SPONSOR
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
