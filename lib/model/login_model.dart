class LoginModel {
  LoginModel({
    this.status,
    this.data,
    this.debugParamSent,
    this.debugLive,
  });

  Status? status;
  Data? data;
  DebugParamSent? debugParamSent;
  String? debugLive;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: Status.fromJson(json["status"]),
        data: Data.fromJson(json["data"]),
        debugParamSent: DebugParamSent.fromJson(json["debug-param-sent"]),
        debugLive: json["debug-live"],
      );

  Map<String, dynamic> toJson() => {
        "status": status!.toJson(),
        "data": data!.toJson(),
        "debug-param-sent": debugParamSent!.toJson(),
        "debug-live": debugLive,
      };
}

class Data {
  Data({
    this.user,
  });

  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.userId,
    this.language,
    this.fullName,
    this.phone,
    this.emailAddress,
    this.role,
    this.designation,
    this.outletId,
  });

  String? userId;
  String? language;
  String? fullName;
  String? phone;
  String? emailAddress;
  String? role;
  String? designation;
  String? outletId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        language: json["language"],
        fullName: json["full_name"],
        phone: json["phone"],
        emailAddress: json["email_address"],
        role: json["role"],
        designation: json["designation"],
        outletId: json["outlet_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "language": language,
        "full_name": fullName,
        "phone": phone,
        "email_address": emailAddress,
        "role": role,
        "designation": designation,
        "outlet_id": outletId,
      };
}

class DebugParamSent {
  DebugParamSent({
    this.actLoginUnAdminAdminComUpAdmin,
  });

  String? actLoginUnAdminAdminComUpAdmin;

  factory DebugParamSent.fromJson(Map<String, dynamic> json) => DebugParamSent(
        actLoginUnAdminAdminComUpAdmin: json[
            "{\u000d\n____\"act\":\"LOGIN\",\u000d\n____\"un\":\"admin@admin_com\",\u000d\n____\"up\":\"admin\"\u000d\n____}"],
      );

  Map<String, dynamic> toJson() => {
        "{\u000d\n____\"act\":\"LOGIN\",\u000d\n____\"un\":\"admin@admin_com\",\u000d\n____\"up\":\"admin\"\u000d\n____}":
            actLoginUnAdminAdminComUpAdmin,
      };
}

class Status {
  Status({
    this.error,
    this.login,
    this.userId,
    this.role,
    this.apiVer,
    this.devDebugParam,
  });

  int? error;
  bool? login;
  String? userId;
  String? role;
  String? apiVer;
  String? devDebugParam;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        error: json["error"],
        login: json["login"],
        userId: json["user_id"],
        role: json["role"],
        apiVer: json["api-ver"],
        devDebugParam: json["dev-debug-param"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "login": login,
        "user_id": userId,
        "role": role,
        "api-ver": apiVer,
        "dev-debug-param": devDebugParam,
      };
}
