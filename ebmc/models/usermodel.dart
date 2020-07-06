import 'dart:convert';

Createuser createuserFromJson(String str) =>
    Createuser.fromJson(json.decode(str));

String createuserToJson(Createuser data) => json.encode(data.toJson());

class Createuser {
  Createuser({
    this.name,
    this.email,
    this.password,
  });

  String name;
  String email;
  String password;

  factory Createuser.fromJson(Map<String, dynamic> json) => Createuser(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
