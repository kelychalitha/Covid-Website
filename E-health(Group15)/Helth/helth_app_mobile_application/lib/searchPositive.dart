import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care/positiveViewAdmin.dart';
import 'package:health_care/widgets/custom_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:health_care/widgets/phi_drawer.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/connection.dart';
import 'controllers/getCiticenListByNIC.dart';
import 'controllers/getCitizenByNicAdmin.dart';
import 'controllers/positiveList.dart';

class SearchPositive extends StatefulWidget {
  @override
  _SearchPositiveState createState() => _SearchPositiveState();
}
var searchId;
class _SearchPositiveState extends State<SearchPositive> {
  void initState() {
    super.initState();
    user ();
    super.initState();

  }
  TextEditingController _nic = TextEditingController();
  user () async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    searchId= prefs.getString("search-key1");

    setState(() {});

  }
  List data;
  var ip = Configuration.base_url;

  Future<List> getData() async {
    print(searchId);
    final response = await http.get("$ip/citizen/citizen/$searchId");
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

      body:
      Container(
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

          child: ListView(
              children: [
                Text("Patients", style: TextStyle(
                    color: Colors.black,
                    fontSize: 25, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height:20,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(children:[
                    Expanded(child:
                    Container(
                      margin:EdgeInsets.only(left:4,right: 20),
                      child: TextField(
                        controller: _nic,
                        decoration: InputDecoration(
                            hintText: '  Search NIC'
                        ),
                        onChanged: (value){
                          nic = value;
                        },
                      ),
                    ),

                    ),
                    IconButton(icon: Icon(Icons.search), onPressed:()  async {

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('search-key1',nic);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPositive())
                      );
                    },),


                  ]),
                ),
                SizedBox(
                  height:30,
                ),
                Expanded( child: new FutureBuilder<List>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? new  PositiveList(
                      list: snapshot.data,
                    )
                        : new Center(
                      child: Text("No Records Founds!!", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red, fontSize: 20),),
                    );
                  },
                ),
                )

              ]
          ),
        ),
      ),

      drawer: CustomDrawer(),
    );

  }
}