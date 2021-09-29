/*
se crea la clase ApiServices para el consumo  de
servicios rest. En este caso se usa Dio que es facil de
implementar y funciona para todas las plataformas que soporta 
Flutter
*/

import 'package:dio/dio.dart';
import 'package:listusers_antpack/models/my_http_response.dart';
import 'package:listusers_antpack/models/user.dart';
import 'package:listusers_antpack/utils/app_constants.dart';

class ApiServices {
  Future<MyHttpResponse> getListUsers() async {
    var response = await Dio().get(
      AppConstants.baseUrl + AppConstants.usersEndPoint,
    );

    List<User> _listUsers = [];

    if (response.statusCode == 200) {
      response.data.forEach((_user) {
        _listUsers.add(User.fromJson(_user));
      });
    }

    return MyHttpResponse(
      response.statusCode,
      _listUsers,
      message: response.statusMessage ?? "",
    );
  }
}
