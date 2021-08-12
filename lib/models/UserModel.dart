// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';
import './UserSpec.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.results,
    this.info,
  });

  List<UserSpec> results;
  Info info;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        results: List<UserSpec>.from(
            json["results"].map((x) => UserSpec.fromJson(x))),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "info": info.toJson(),
      };
}

class Info {
  Info({
    this.seed,
    this.results,
    this.page,
    this.version,
  });

  String seed;
  int results;
  int page;
  String version;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
      };
}
