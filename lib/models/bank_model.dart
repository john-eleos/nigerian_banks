// To parse this JSON data, do
//
//     final bankModel = bankModelFromJson(jsonString);

import 'dart:convert';

import 'dart:math';

List<BankModel> bankModelFromJson(String str) => List<BankModel>.from(json.decode(str).map((x) => BankModel.fromJson(x)));

String bankModelToJson(List<BankModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BankModel {

  BankModel({
              this.name,
              this.slug,
              this.code,
              this.ussd,
              this.logo,
              }):_hash = 1000 + Random().nextInt(99999 - 1000);

  String name;
  String slug;
  String code;
  String ussd;
  String logo;

  /// [_hash] is used to compare instances of [PhoneNumber] object.
  final int _hash;

  /// Returns an integer generated after the object was initialised.
  /// Used to compare different instances of [PhoneNumber]
  int get hash => _hash;
  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
    name: json["name"],
    slug: json["slug"],
    code: json["code"],
    ussd: json["ussd"],
    logo: json["logo"],
    );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
    "code": code,
    "ussd": ussd,
    "logo": logo,
  };
  }
