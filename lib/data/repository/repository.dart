import 'dart:developer';

import 'package:react_conf/data/api/api_services.dart';

class Repository {
  final ApiServices apiServices = ApiServices();

  // Future<dynamic> sendLoginRequest(
  //     {required String userId, required String password}) async {
  //   final userLoginData = await authApiServices.sendUserLoginRequest(
  //       userId: userId, password: password);
  //   return userLoginData;
  // }
  //
  // Future<dynamic> userLogoutRequest() async {
  //   final logoutResponse = await authApiServices.sendUserLogoutRequest();
  //   return logoutResponse;
  // }
}
