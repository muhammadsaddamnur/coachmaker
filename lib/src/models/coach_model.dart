import 'dart:convert';

CoachModel coachModelFromJson(String str) =>
    CoachModel.fromJson(json.decode(str));

String coachModelToJson(CoachModel data) => json.encode(data.toJson());

class CoachModel {
  CoachModel({
    this.initialList,
  });

  List<InitialList>? initialList;

  factory CoachModel.fromJson(Map<String, dynamic> json) => CoachModel(
        initialList: json["initialList"] == null
            ? null
            : List<InitialList>.from(
                json["initialList"].map((x) => InitialList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "initialList": initialList == null
            ? null
            : List<dynamic>.from(initialList!.map((x) => x.toJson())),
      };
}

class InitialList {
  InitialList({
    this.initial,
    this.title,
    this.subtitle,
    this.image,
  });

  String? initial;
  String? title;
  List<dynamic>? subtitle;
  String? image;

  factory InitialList.fromJson(Map<String, dynamic> json) => InitialList(
        initial: json["initial"] == null ? null : json["initial"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null
            ? null
            : List<dynamic>.from(json["subtitle"].map((x) => x)),
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "initial": initial == null ? null : initial,
        "title": title == null ? null : title,
        "subtitle": subtitle == null
            ? null
            : List<dynamic>.from(subtitle!.map((x) => x)),
        "image": image == null ? null : image,
      };
}
