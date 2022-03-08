// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class User {
  User({
    this.username,
    this.firstName,
    this.lastName,
    this.id,
    this.location,
    this.dateOfBirth,
  });

  String? username;
  String? firstName;
  String? lastName;
  int? id;
  String? location;
  DateTime? dateOfBirth;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"] == null ? null : json["username"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    id: json["id"] == null ? null : json["id"],
    location: json["location"] == null ? null : json["location"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
  );

  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "id": id == null ? null : id,
    "location": location == null ? null : location,
    "dateOfBirth": dateOfBirth == null ? null : dateOfBirth!.toIso8601String(),
  };
}

