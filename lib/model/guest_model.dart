import 'dart:convert';

import 'package:qr_invitation_app/model/result_model.dart';

class GuestModel extends ResultModel {
  String? name;

  GuestModel({
    this.name,
  });

  GuestModel copyWith({
   required String? name,
  }) =>
      GuestModel(
        name: name ?? this.name,
      );

  factory GuestModel.fromJson(String str) =>
      GuestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GuestModel.fromMap(Map<String, dynamic> json) => GuestModel(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
