import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/connection.dart';
import 'package:http/http.dart' as http;
import 'citi.dart';
import 'citidashpro.dart';
import 'controllers/citizenAuth.dart';
import 'dashphi.dart';

//phi login page

class CitizenLogin extends StatefulWidget {
  CitizenLogin({Key key, this.title}) : super(key: key);
  CitizenAuth citizenAuth = new CitizenAuth();


  final String title;

  @override
  _CitizenLoginState createState() => _CitizenLoginState();

}

class _CitizenLoginState extends State<CitizenLogin> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  void initState() {
    super.initState();
    user();
    super.initState();
  }

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token1') != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) =>  DashBoardCitiPage()),
              (Route<dynamic> route) => false);
    }
  }
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
    print(parse["token"]);
    print(parse["nic"]);
    if(parse["token"] != null && parse["status"] == "Live")
      {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token1',parse["token"]);
        await prefs.setString('userEmail1',parse["email"]);
        await prefs.setString("isLoggedIn1", "logged");
        await prefs.setString('cid',parse["id"]);
        await prefs.setString('fname',parse["fname"]);
        await prefs.setString('search-key',null);
        await prefs.setString('lname',parse["lname"]);
        await prefs.setString('age',parse["age"]);
        await prefs.setString('prof',parse["profeson"]);
        await prefs.setString('affilication',parse["affilication"]);
        await prefs.setString('unic',parse["nic"]);
        await prefs.setString('address',parse["address"]);
        await prefs.setString('phone',parse["phone"]);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => DashBoardCitiPage()),
                (Route<dynamic> route) => false);
      }
    if(parse["status"] == "Deactivated")
      {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.QUESTION,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Login Failed!!',
          desc: 'Your Account Deactivated..',
          btnCancelOnPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CitizenLogin()));
          },
          btnOkOnPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CitizenLogin()));
          },
        )..show();
      }
    else{
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CitizenLogin()));
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
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                    ),

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
                    controller: _password,
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
                      if (_email == null ||
                          _password == null) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Login Failed!!',
                          desc: 'All Fields Required',
                          btnCancelOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CitizenLogin()));
                          },
                          btnOkOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CitizenLogin()));
                          },
                        )..show();
                      } else {
                        loginCitizen(_email.text, _password.text);
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
