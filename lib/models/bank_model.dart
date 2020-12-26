import 'dart:convert';

import 'dart:math';

/// [bankModelFromJson] converts [bankList] json string to [List] object of [BankModel] class
List<BankModel> bankModelFromJson(String str) =>
    List<BankModel>.from(json.decode(str).map((x) => BankModel.fromJson(x)));

/// [bankModelToJson] converts [List] object of [BankModel] class to [bankList] json string
String bankModelToJson(List<BankModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// [BankModel] class used for serializing the bankList json
/// [BankModel.name] variable to hold name of the bank
/// [BankModel.slug] variable to hold slug(short name) of the bank
/// [BankModel.code] variable to hold code of the bank
/// [BankModel.ussd] variable to hold ussd of the bank
/// [BankModel.logo] variable to hold logo url of the bank
class BankModel {
  BankModel({
    this.name,
    this.slug,
    this.code,
    this.ussd,
    this.logo,
  }) : _hash = 1000 + Random().nextInt(99999 - 1000);
  String name;
  String slug;
  String code;
  String ussd;
  String logo;

  /// [_hash] is used to compare instances of [BankModel] object.
  final int _hash;

  /// Returns an integer generated after the object was initialised.
  /// Used to compare different instances of [BankModel]
  int get hash => _hash;

  /// [BankModel.fromJson] converts json item to object of [BankModel]
  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        ussd: json["ussd"],
        logo: json["logo"],
      );

  /// [BankModel.toJson] converts object of [BankModel] item to json item
  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "code": code,
        "ussd": ussd,
        "logo": logo,
      };
}
