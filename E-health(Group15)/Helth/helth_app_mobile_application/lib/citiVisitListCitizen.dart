import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_care/widgets/citizen_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Api/connection.dart';
import 'controllers/citihealthCon.dart';

class CitiVisitListPageCiti extends StatefulWidget {
  @override
  _CitiVisitListPageCitiState createState() => _CitiVisitListPageCitiState();
}
String cid;
class _CitiVisitListPageCitiState extends State<CitiVisitListPageCiti > {
  void initState() {
    super.initState();
    user ();
    super.initState();

  }
  user () async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _cid= prefs.getString("cid");
    cid = _cid;

    setState(() {});

  }
  List data;
  var ip = Configuration.base_url;
  Future<List> getData() async {
    print(cid);
    final response = await http.get("$ip/citizen/citizenReports/$cid");
    return json.decode(response.body);
  }
  bool showPassword = false;
  final ScrollController _scrollController = ScrollController();

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.blue[700],
      ),

      body:  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image:  AssetImage("images/im2.jpg"),
              fit: BoxFit.cover,
            )
        ),

        child: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: new FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new  MyHelth(
                list: snapshot.data,
              )
                  : new Center(
                child: Text("No Records Found Belongs to You!!!", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red, fontSize: 20),),
              );
            },
          ),
        ),
      ),


      drawer: CitiDrawer(),
    );

  }
}