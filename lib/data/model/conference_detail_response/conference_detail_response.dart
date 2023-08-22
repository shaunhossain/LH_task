

import 'dart:convert';

ConferenceDetailResponse conferenceDetailResponseFromJson(String str) => ConferenceDetailResponse.fromJson(jsonDecode(str));

String conferenceDetailResponseToJson(ConferenceDetailResponse data) => json.encode(data.toJson());

class ConferenceDetailResponse {
  final Data? data;

  ConferenceDetailResponse({
    this.data,
  });

  factory ConferenceDetailResponse.fromJson(Map<String, dynamic> json) => ConferenceDetailResponse(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  final Conference? conference;

  Data({
    this.conference,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    conference: json["conference"] == null ? null : Conference.fromJson(json["conference"]),
  );

  Map<String, dynamic> toJson() => {
    "conference": conference?.toJson(),
  };
}

class Conference {
  final List<Organizer>? organizers;
  final List<Organizer>? speakers;
  final List<Schedule>? schedules;
  final List<Organizer>? sponsors;

  Conference({
    this.organizers,
    this.speakers,
    this.schedules,
    this.sponsors,
  });

  factory Conference.fromJson(Map<String, dynamic> json) => Conference(
    organizers: json["organizers"] == null ? [] : List<Organizer>.from(json["organizers"]!.map((x) => Organizer.fromJson(x))),
    speakers: json["speakers"] == null ? [] : List<Organizer>.from(json["speakers"]!.map((x) => Organizer.fromJson(x))),
    schedules: json["schedules"] == null ? [] : List<Schedule>.from(json["schedules"]!.map((x) => Schedule.fromJson(x))),
    sponsors: json["sponsors"] == null ? [] : List<Organizer>.from(json["sponsors"]!.map((x) => Organizer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "organizers": organizers == null ? [] : List<dynamic>.from(organizers!.map((x) => x.toJson())),
    "speakers": speakers == null ? [] : List<dynamic>.from(speakers!.map((x) => x.toJson())),
    "schedules": schedules == null ? [] : List<dynamic>.from(schedules!.map((x) => x.toJson())),
    "sponsors": sponsors == null ? [] : List<dynamic>.from(sponsors!.map((x) => x.toJson())),
  };
}

class Organizer {
  final String? name;
  final String? about;
  final Image? image;
  final Social? social;

  Organizer({
    this.name,
    this.about,
    this.image,
    this.social,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) => Organizer(
    name: json["name"],
    about: json["about"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    social: json["social"] == null ? null : Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "about": about,
    "image": image?.toJson(),
    "social": social?.toJson(),
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

class Social {
  final String? github;
  final dynamic twitch;
  final dynamic facebook;
  final dynamic dribble;

  Social({
    this.github,
    this.twitch,
    this.facebook,
    this.dribble,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    github: json["github"],
    twitch: json["twitch"],
    facebook: json["facebook"],
    dribble: json["dribble"],
  );

  Map<String, dynamic> toJson() => {
    "github": github,
    "twitch": twitch,
    "facebook": facebook,
    "dribble": dribble,
  };
}

class Schedule {
  final DateTime? day;
  final String? description;
  final List<Interval>? intervals;

  Schedule({
    this.day,
    this.description,
    this.intervals,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    day: json["day"] == null ? null : DateTime.parse(json["day"]),
    description: json["description"],
    intervals: json["intervals"] == null ? [] : List<Interval>.from(json["intervals"]!.map((x) => Interval.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "day": "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
    "description": description,
    "intervals": intervals == null ? [] : List<dynamic>.from(intervals!.map((x) => x.toJson())),
  };
}

class Interval {
  final List<Session>? sessions;

  Interval({
    this.sessions,
  });

  factory Interval.fromJson(Map<String, dynamic> json) => Interval(
    sessions: json["sessions"] == null ? [] : List<Session>.from(json["sessions"]!.map((x) => Session.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sessions": sessions == null ? [] : List<dynamic>.from(sessions!.map((x) => x.toJson())),
  };
}

class Session {
  final DateTime? day;
  final String? title;
  final String? begin;
  final String? end;

  Session({
    this.day,
    this.title,
    this.begin,
    this.end,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    day: json["day"] == null ? null : DateTime.parse(json["day"]),
    title: json["title"],
    begin: json["begin"],
    end: json["end"],
  );

  Map<String, dynamic> toJson() => {
    "day": "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
    "title": title,
    "begin": begin,
    "end": end,
  };
}
