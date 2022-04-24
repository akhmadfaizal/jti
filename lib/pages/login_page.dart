import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jti_app/constant/constant.dart';
import 'package:jti_app/model/login_model.dart' as login_model;
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool? isLogin = false;
  @override
  void initState() {
    super.initState();
    initShared();
  }

  late SharedPreferences preferences;
  Future initShared() async {
    preferences = await SharedPreferences.getInstance();
    isLogin = preferences.getBool('login');
    if (isLogin == true) {
      Navigator.pushReplacementNamed(context, '/MainPage');
    }
  }

  logIn(context) async {
    var jsonData;
    final response = await http.post(
      Uri.parse('http://test-tech.api.jtisrv.com/md/public/API/Auth'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "act": "LOGIN",
        "un": "admin@admin.com",
        "up": "admin"
      }),
    );

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      if (jsonData['status']['login'] == true) {
        preferences.setBool('login', jsonData['status']['login']);
        Navigator.pushReplacementNamed(context, '/MainPage');
      } else {
        print('Failed Log In');
      }
    } else {
      throw Exception('No Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(blueColourThree),
        child: Center(
          child: ElevatedButton(
            child: const Text('Log In'),
            onPressed: () {
              logIn(context);
            },
          ),
        ),
      ),
    );
  }
}
