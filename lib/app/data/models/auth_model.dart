class AuthModel {
  AuthModel({
    this.success,
    this.requestToken,
    this.idUser,
  });

  bool? success;
  String? requestToken;
  int? idUser;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        success: json["success"],
        requestToken: json["request_token"],
        idUser: json["id_user"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "request_token": requestToken,
        "id_user": idUser,
      };
}
