import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String? status;
  final Data? data;
  final String? message;

  LoginResponse({
    this.status,
    this.data,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  final AuthenticatedUser? authenticatedUser;
  final String? token;
  final String? browserInfo;

  Data({
    this.authenticatedUser,
    this.token,
    this.browserInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    authenticatedUser: json["authenticatedUser"] == null ? null : AuthenticatedUser.fromJson(json["authenticatedUser"]),
    token: json["token"],
    browserInfo: json["browserInfo"],
  );

  Map<String, dynamic> toJson() => {
    "authenticatedUser": authenticatedUser?.toJson(),
    "token": token,
    "browserInfo": browserInfo,
  };
}

class AuthenticatedUser {
  final int? id;
  final String? employeeId;
  final String? name;
  final String? email;
  final int? designationId;
  final int? officeLocationId;
  final int? userTypeId;
  final int? status;
  final dynamic createdUserBrowserInfo;
  final dynamic updatedUserBrowserInfo;
  final List<Role>? roles;
  final List<dynamic>? permissions;

  AuthenticatedUser({
    this.id,
    this.employeeId,
    this.name,
    this.email,
    this.designationId,
    this.officeLocationId,
    this.userTypeId,
    this.status,
    this.createdUserBrowserInfo,
    this.updatedUserBrowserInfo,
    this.roles,
    this.permissions,
  });

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) => AuthenticatedUser(
    id: json["id"],
    employeeId: json["employee_id"],
    name: json["name"],
    email: json["email"],
    designationId: json["designation_id"],
    officeLocationId: json["office_location_id"],
    userTypeId: json["user_type_id"],
    status: json["status"],
    createdUserBrowserInfo: json["created_user_browser_info"],
    updatedUserBrowserInfo: json["updated_user_browser_info"],
    roles: json["roles"] == null ? [] : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
    permissions: json["permissions"] == null ? [] : List<dynamic>.from(json["permissions"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_id": employeeId,
    "name": name,
    "email": email,
    "designation_id": designationId,
    "office_location_id": officeLocationId,
    "user_type_id": userTypeId,
    "status": status,
    "created_user_browser_info": createdUserBrowserInfo,
    "updated_user_browser_info": updatedUserBrowserInfo,
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x.toJson())),
    "permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x)),
  };
}

class Role {
  final int? id;
  final String? name;
  final String? guardName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;
  final List<dynamic>? permissions;

  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
    this.permissions,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    guardName: json["guard_name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    permissions: json["permissions"] == null ? [] : List<dynamic>.from(json["permissions"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guard_name": guardName,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
    "permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x)),
  };
}

class Pivot {
  final int? modelId;
  final int? roleId;
  final String? modelType;

  Pivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    modelId: json["model_id"],
    roleId: json["role_id"],
    modelType: json["model_type"],
  );

  Map<String, dynamic> toJson() => {
    "model_id": modelId,
    "role_id": roleId,
    "model_type": modelType,
  };
}
