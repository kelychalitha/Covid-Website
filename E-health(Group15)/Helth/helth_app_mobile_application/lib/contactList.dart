import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care/widgets/custom_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/connection.dart';
import 'controllers/getCiticenListByNIC.dart';
import 'controllers/getPhiByNic.dart';
import 'controllers/messages.dart';
import 'phi_view_admin.dart';

class ContactUS extends StatefulWidget {
  @override
  _ContactUSState createState() => _ContactUSState();
}

var searchId;

class _ContactUSState extends State<ContactUS> {
  void initState() {
    super.initState();
    user();
    super.initState();
  }

  TextEditingController _nic = TextEditingController();
  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    searchId = prefs.getString("search-key3");

    setState(() {});
  }

  List data;
  var ip = Configuration.base_url;

  Future<List> getData() async {
    print(searchId);
    final response = await http.get("$ip/contact/messages/");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    var nic;
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/im2.jpg"),
          fit: BoxFit.cover,
        )),
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(children: [
            Text(
              "Messages",
              style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: new FutureBuilder<List>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? new Messages(
                          list: snapshot.data,
                        )
                      : new Center(
                          child: Text(
                            "No Records Founds!!",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 20),
                          ),
                        );
                },
              ),
            )
          ]),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
