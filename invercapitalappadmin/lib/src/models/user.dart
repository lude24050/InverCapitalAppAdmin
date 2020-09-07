class User {
  User({
    this.userId,
    this.username,
    this.password,
    this.typeUser,
    this.name,
    this.lastName,
    this.dni,
    this.state,
    this.createdAt,
    this.updatedAt,
  });

  int userId;
  String username;
  String password;
  String typeUser;
  String name;
  String lastName;
  int dni;
  String state;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        username: json["username"],
        password: json["password"],
        typeUser: json["type_user"],
        name: json["name"],
        lastName: json["lastName"],
        dni: json["dni"],
        state: json["state"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "password": password,
        "type_user": typeUser,
        "name": name,
        "lastName": lastName,
        "dni": dni,
        "state": state,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
