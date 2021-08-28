import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_care/widgets/phi_drawer.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/connection.dart';
import 'controllers/getCiticenListByNIC.dart';

class PhiHealthPageList extends StatefulWidget {
  @override
  _PhiHealthPageListState createState() => _PhiHealthPageListState();
}
var searchId;
class _PhiHealthPageListState extends State<PhiHealthPageList> {
  void initState() {
    super.initState();
    user ();
    super.initState();

  }
  TextEditingController _nic = TextEditingController();
  user () async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    searchId= prefs.getString("search-key");

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
                Text("Citizen Health Status", style: TextStyle(
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
                      await prefs.setString('search-key',nic);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PhiHealthPageList())
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
                        ? new  CitizenListById(
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

      drawer: PhiDrawer(),
    );

  }
}