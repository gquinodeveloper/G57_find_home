class UserModel {
  UserModel({
    this.name,
    this.lastname,
    this.adress,
    this.email,
    this.password,
    this.address,
  });

  String? name;
  String? lastname;
  String? adress;
  String? email;
  String? password;
  String? address;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        lastname: json["lastname"],
        address: json["address"] ?? "",
        adress: json["adress"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "adress": adress,
        "email": email,
        "password": password,
      };
}
