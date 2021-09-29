import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listusers_antpack/models/my_http_response.dart';
import 'package:listusers_antpack/models/user.dart';
import 'package:listusers_antpack/network/api_services.dart';
import 'package:listusers_antpack/network/local_data.dart';
import 'package:listusers_antpack/ui/local_widgets/card_user_detail.dart';
import 'package:listusers_antpack/utils/app_colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> _listUsers = [];
  @override
  void initState() {
    super.initState();
    _veryfyConnection();
  }

  void _veryfyConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    MyHttpResponse response;

    if (connectivityResult == ConnectivityResult.none) {
      response = await LocalRequest().getListUsersLocal();
    } else {
      response = await ApiServices().getListUsers();
    }

    if (response.statusCode == 200) {
      setState(() {
        _listUsers = response.data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de usuarios"),
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: ListView.builder(
          itemCount: _listUsers.length,
          itemBuilder: (BuildContext context, int index) {
            return CardUserDetail(user: _listUsers[index]);
          },
        ),
      ),
    );
  }
}
