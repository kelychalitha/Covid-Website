import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/connection.dart';
import 'citi.dart';
import 'controllers/auth.dart';
import 'dashphi.dart';

//phi login page

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  void initState() {
    super.initState();
    user();
    super.initState();
  }

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => DashBoardPhiPage()),
              (Route<dynamic> route) => false);
    }
  }
  Future<String>  loginPhi(email, password) async {
    var ip = Configuration.base_url;
    var url = "$ip/auth/philogin"; //
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
    print(parse["id"]);
    if (parse["token"] != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', parse["token"]);
      await prefs.setString('userEmail', parse["email"]);
      await prefs.setString("isLoggedIn", "logged");
      await prefs.setString('pid', parse["id"]);
      await prefs.setString('fnmep', parse["fname"]);
      await prefs.setString('lnamep', parse["lname"]);
      await prefs.setString('phonep', parse["phone"]);
      await prefs.setString('search-key', null);
          await prefs.setString('search-key1', null);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => DashBoardPhiPage()),
              (Route<dynamic> route) => false);
    }
    else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Login Failed!!',
        desc: 'Something is Wrong.. Please Try Again..',
        btnCancelOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage()));
        },
      )
        ..show();
    }
  }
 

  @override
  Widget build(BuildContext context) {
   var email, password;
    return Scaffold(
      backgroundColor: Colors.white,
      body:ListView(
        children: [
          Container(
            

            height:350,
            decoration: BoxDecoration(
              
              image: DecorationImage(image:AssetImage("images/login1.jpg"),fit: BoxFit.cover,
              ),
            ),
           

          ),
          SizedBox(
            height:40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(children:[
              IconButton(icon: Icon(Icons.person), onPressed:() {},),

              
              Expanded(child:
              Container(
                margin:EdgeInsets.only(left:4,right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),   
              ),
            ]),
          ),
          SizedBox(
            height: 50,
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(children:[
              IconButton(icon: Icon(Icons.lock), onPressed:() {},),
              Expanded(child:
              Container(
                margin:EdgeInsets.only(left:4,right: 20),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Passward'
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),   
              ),
            ]),
          ),
          SizedBox(
            height:40,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:ClipRRect(
              borderRadius:BorderRadius.circular(7),
            // ),
            child:Container(
              height: 60,
            // )
            child: RaisedButton(
              color:Colors.blueAccent[700],
              onPressed: () async {
                if (email == null ||
                    password == null) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.ERROR,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Login Failed!!',
                    desc: 'Something is Wrong.. Please Try Again..',
                    btnCancelOnPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()));
                    },
                    btnOkOnPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()));
                    },
                  )..show();
                } else {
                  loginPhi(email, password);
                }
              },
              child: Text('Submit',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              ),
            ),
          ),


            ),
          ),
        ],
      )
      
     
    );
  }
}
 