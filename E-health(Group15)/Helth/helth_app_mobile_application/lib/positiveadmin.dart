import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:health_care/phiviewAll.dart';
import 'package:health_care/positiveViewAdmin.dart';
import 'package:health_care/searchPositive.dart';
import 'package:health_care/widgets/custom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Api/connection.dart';

class PositiveAdminPage extends StatefulWidget {
  List list;
  int index;
  PositiveAdminPage({this.index, this.list});
  @override
  _PositiveAdminPageState createState() => _PositiveAdminPageState();
}

class _PositiveAdminPageState extends State<PositiveAdminPage> {
  bool showPassword = false;
  final ScrollController _scrollController = ScrollController();
  Future<String>  sendemail(email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var pId = prefs.getString('pid');
    var ip = Configuration.base_url;
    var url = "$ip/citizen/email/$email"; //
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{

        'email': email,
      }),
    );


    var parse = response.statusCode;

    if (parse == 200) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Success!!',
        desc: 'okn..',
        btnCancelOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhiViewAdminAll()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhiViewAdminAll()));
        },
      )
        ..show();
    }
    else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Email sent  Failed!!',
        desc: 'Something goes Wrong..',
        btnCancelOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhiViewAdminAll()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhiViewAdminAll()));
        },
      )
        ..show();
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenwidth =  MediaQuery.of(context).size.width;
    var nic;
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

    child: ListView(
    children: [
    Text("Positive Patients", style: TextStyle(
    color: Colors.black,
    fontSize: 25, fontWeight: FontWeight.w900),
    ),
    
     SizedBox(
      height:25,
    ),
    Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(children:[

              Expanded(child:
              Container(
                margin:EdgeInsets.only(left:4,right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '  Search NIC'
                  ),
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
          Container(
      width: screenwidth,
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50 ),
      decoration: BoxDecoration(color: Colors.black,
                borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("First Name", style: TextStyle(color: Colors.white),),
              

              Text("${widget.list[widget.index]['fname']}", style: TextStyle(color: Colors.white),),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Last Name", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['lname']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
           SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("NIC", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['nic']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
           SizedBox(
            height: 5,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Age ", style: TextStyle(color: Colors.white),),

          //     Text("22", style: TextStyle(color: Colors.white),),
          //   ],
          // ),
          //  Divider(
          //   color: Colors.white,
          // ),
          //  SizedBox(
          //   height: 5,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Address ", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['address']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
           SizedBox(
            height: 5,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Profession", style: TextStyle(color: Colors.white),),

          //     Text("12365478V", style: TextStyle(color: Colors.white),),
          //   ],
          // ),
          //  Divider(
          //   color: Colors.white,
          // ),
          //  SizedBox(
          //   height: 5,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Email", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['email']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
           SizedBox(
            height: 5,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Affiliation", style: TextStyle(color: Colors.white),),

          //     Text("yyyyy", style: TextStyle(color: Colors.white),),
          //   ],
          // ),
          //  Divider(
          //   color: Colors.white,
          // ),
          //  SizedBox(
          //   height: 5,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Current Location ", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['location']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Health Status", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['results']}", style: TextStyle(color: Colors.yellowAccent),),
            ],
          ),
         
           Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Test ", style: TextStyle(color: Colors.white),),

          //     Text("PCR", style: TextStyle(color: Colors.white),),
          //   ],
          // ),
          
          //  Divider(
          //   color: Colors.white,
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Result", style: TextStyle(color: Colors.white),),

          //     Text("Negative", style: TextStyle(color: Colors.white),),
          //   ],
          // ),
         
          //  Divider(
          //   color: Colors.white,
          // ),
          // SizedBox(
          //   height: 15,
          // ),
          Container(
            width: MediaQuery.of(context).size.width - 80,
            // height: 20,
            // color: Colors.grey,
            child: RaisedButton(
              onPressed: (){
                sendemail("${widget.list[widget.index]['email']}");
              },
              color: Colors.blue[700],
              child: Text("Email"),),
          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Update", style: TextStyle(color: Colors.white),),

          //     Text("", style: TextStyle(color: Colors.white),),
          //   ],
          // ),
        ],
      ),

      
    ),
     SizedBox(
       
            height: 15,
          ),

  
    ]
    ),
      ),
        ),

        drawer: CustomDrawer(),
    );
      
  }
}