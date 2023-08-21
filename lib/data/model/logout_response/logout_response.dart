import 'dart:convert';

LogoutResponse logoutResponseFromJson(String str) => LogoutResponse.fromJson(json.decode(str));

String logoutResponseToJson(LogoutResponse data) => json.encode(data.toJson());

class LogoutResponse {
  final String? status;
  final dynamic data;
  final String? message;

  LogoutResponse({
    this.status,
    this.data,
    this.message,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => LogoutResponse(
    status: json["status"],
    data: json["data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}
