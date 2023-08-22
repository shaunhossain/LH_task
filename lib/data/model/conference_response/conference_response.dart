import 'dart:convert';

ConferenceResponse conferenceResponseFromJson(String str) => ConferenceResponse.fromJson(jsonDecode(str));

String conferenceResponseToJson(ConferenceResponse data) => json.encode(data.toJson());

class ConferenceResponse {
  final ConferenceData? data;

  ConferenceResponse({
    this.data,
  });

  factory ConferenceResponse.fromJson(Map<String, dynamic> json) => ConferenceResponse(
    data: json["data"] == null ? null : ConferenceData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class ConferenceData {
  final List<Conference>? conferences;

  ConferenceData({
    this.conferences,
  });

  factory ConferenceData.fromJson(Map<String, dynamic> json) => ConferenceData(
    conferences: json["conferences"] == null ? [] : List<Conference>.from(json["conferences"]!.map((x) => Conference.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "conferences": conferences == null ? [] : List<dynamic>.from(conferences!.map((x) => x.toJson())),
  };
}

class Conference {
  final String? id;
  final String? name;
  final String? slogan;
  final DateTime? startDate;

  Conference({
    this.id,
    this.name,
    this.slogan,
    this.startDate,
  });

  factory Conference.fromJson(Map<String, dynamic> json) => Conference(
    id: json["id"],
    name: json["name"],
    slogan: json["slogan"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slogan": slogan,
    "startDate": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
  };
}