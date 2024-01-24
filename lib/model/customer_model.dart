import 'dart:convert';

import 'package:qr_invitation_app/model/result_model.dart';

class CustomerModel extends ResultModel {
  String? name;
  int? password;
  int? invitationRange;
  String? customerId;

  CustomerModel({
    this.name,
    this.password,
    this.invitationRange,
    this.customerId,
  });

  CustomerModel copyWith({
    String? name,
    int? password,
    int? invitationRange,
    String? customerId,
  }) =>
      CustomerModel(
        name: name ?? this.name,
        password: password ?? this.password,
        invitationRange: invitationRange ?? this.invitationRange,
        customerId: customerId ?? this.customerId,
      );

  factory CustomerModel.fromJson(String str) =>
      CustomerModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromMap(Map<String, dynamic> json) => CustomerModel(
        name: json["name"],
        password: json["password"],
        invitationRange: json["invitationRange"],
        customerId: json["customerId"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "password": password,
        "invitationRange": invitationRange,
        "customerId": customerId,
      };
}
