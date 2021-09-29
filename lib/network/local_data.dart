/*
se crea la clase LocalRequest para llamar el archivo local
y poner información en la aplicación cuando no hay conexion
a internet
*/

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:listusers_antpack/models/my_http_response.dart';
import 'package:listusers_antpack/models/user.dart';

class LocalRequest {
  Future<MyHttpResponse> getListUsersLocal() async {
    // se usa rootBundle para leer el archivo que se encuentra en assets/data/jsonplaceholder.json
    String baseJsonStr = await rootBundle.loadString(
      'assets/data/jsonplaceholder.json',
    );

    // se decodifica la información que trae dicho archivo
    Map<String, dynamic> usersFile = json.decode(baseJsonStr);

    List<User> _listUsers = [];

    if (usersFile['data'] != null) {
      usersFile['data'].forEach((_user) {
        _listUsers.add(User.fromJson(_user));
      });
    }

    return MyHttpResponse(
      usersFile['data'] != null ? 200 : 400,
      _listUsers,
      message: "",
    );
  }
}
