import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:health_care/Api/connection.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CitizenAuth extends StatefulWidget {
  @override
  _CitizenAuthState createState() => _CitizenAuthState();
}

class _CitizenAuthState extends State<CitizenAuth> {

  Future<String>  loginCitizen(email, password) async {
    var ip = Configuration.base_url;
    var url = "$ip/auth/citizenlogin"; //
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
//print(response.body);
    var parse = jsonDecode(response.body);
    print(parse["name"]);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token',parse["token"]);
    await prefs.setString('userEmail',parse["email"]);
    await prefs.setString("isLoggedIn", "logged");
    await prefs.setString('search-key',null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
