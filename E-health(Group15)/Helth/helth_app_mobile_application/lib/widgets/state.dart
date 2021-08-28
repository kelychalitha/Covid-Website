import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashphi.dart';
import '../firstscreen.dart';
class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  void initState() {
    super.initState();
    user();
    super.initState();
  }

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("isLoggedIn", "logout");
    await prefs.setString("isLoggedIn", "logout");
    await prefs.setString('token',null);
    await prefs.setString("isLoggedIn1", "logout");
    await prefs.setString('token1',null);
    await prefs.setString('search-key',null);
    await prefs.setString('token2',null);
    await prefs.setString('search-key1',null);
    await prefs.setString('user',null);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => FScreenPage()),
              (Route<dynamic> route) => false);

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
