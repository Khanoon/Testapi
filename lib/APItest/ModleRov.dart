// To parse this JSON data, do
//
//     final modleRov = modleRovFromJson(jsonString);

import 'dart:convert';

List<ModleRov> modleRovFromJson(String str) =>
    List<ModleRov>.from(json.decode(str).map((x) => ModleRov.fromJson(x)));

String modleRovToJson(List<ModleRov> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModleRov {
  Role role;
  Skill passiveSkill;
  Skill firstSkill;
  Skill secondSkill;
  Skill ultimateSkill;
  String id;
  String name;
  String story;
  String image;
  int? v;

  ModleRov({
    required this.role,
    required this.passiveSkill,
    required this.firstSkill,
    required this.secondSkill,
    required this.ultimateSkill,
    required this.id,
    required this.name,
    required this.story,
    required this.image,
    this.v,
  });

  factory ModleRov.fromJson(Map<String, dynamic> json) => ModleRov(
        role: Role.fromJson(json["role"]),
        passiveSkill: Skill.fromJson(json["passiveSkill"]),
        firstSkill: Skill.fromJson(json["firstSkill"]),
        secondSkill: Skill.fromJson(json["secondSkill"]),
        ultimateSkill: Skill.fromJson(json["ultimateSkill"]),
        id: json["_id"],
        name: json["name"],
        story: json["story"],
        image: json["image"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "role": role.toJson(),
        "passiveSkill": passiveSkill.toJson(),
        "firstSkill": firstSkill.toJson(),
        "secondSkill": secondSkill.toJson(),
        "ultimateSkill": ultimateSkill.toJson(),
        "_id": id,
        "name": name,
        "story": story,
        "image": image,
        "__v": v,
      };
}

class Skill {
  String name;
  String image;
  String effect;
  String cooldown;

  Skill({
    required this.name,
    required this.image,
    required this.effect,
    required this.cooldown,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        name: json["name"],
        image: json["image"],
        effect: json["effect"],
        cooldown: json["cooldown"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "effect": effect,
        "cooldown": cooldown,
      };
}

class Role {
  String main;
  String sub;

  Role({
    required this.main,
    required this.sub,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        main: json["main"],
        sub: json["sub"],
      );

  Map<String, dynamic> toJson() => {
        "main": main,
        "sub": sub,
      };
}
