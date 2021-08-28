import 'dart:convert';
import 'package:health_care/widgets/state.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care/widgets/citizen_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/connection.dart';
import 'citizenLogin.dart';
class CitiDashProPage extends StatefulWidget {
  String fname, lname,ge, contct, prof, mail,aff,address;

  CitiDashProPage({this.fname,this.lname,this.ge, this.contct, this.prof, this.mail,this.aff,this.address});
  @override
  _CitiDashProPageState createState() => _CitiDashProPageState();
}

class _CitiDashProPageState extends State<CitiDashProPage> {

  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _age= TextEditingController();
  TextEditingController _pro = TextEditingController();
  TextEditingController _ati = TextEditingController();


  void initState() {
    super.initState();
    user();
  }

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _fname.text = widget.fname;
    _lname.text = widget.lname;
    _address.text = widget.address;
    _phone.text = widget.contct;
    _email.text = widget.mail;

    _age.text = widget.ge;
    _pro.text = widget.prof;
    _ati.text = widget.aff;

    if (prefs.getString('token1') == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => CitizenLogin()),
              (Route<dynamic> route) => false);
    }
  }

  Future<String>  CitizenUpdate(fname,lname,age,phone, pro, email, ati, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var pId = prefs.getString('cid');
    var ip = Configuration.base_url;
    var url = "$ip/auth/updateCitizen/"; //
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': pId,
        'fname': fname,
        'lname': lname,
        'age': age,
        'phone': phone,
        'profeson': pro,
        'email': email,
        'affilication': ati,
        'password': password,
      }),
    );


    var parse = response.statusCode;

    if (parse == 200) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Update Success!!',
        desc: 'Please Login..',
        btnCancelOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Logout()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Logout()));
        },
      )
        ..show();
    }
    else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Update  Failed!!',
        desc: 'Something goes Wrong..',
        btnCancelOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CitiDashProPage()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CitiDashProPage()));
        },
      )
        ..show();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.blue[700],
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,

      //   elevation: 0.0,
      //   leading: IconButton(
      //     color: Colors.grey,
      //     icon: Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Navigator.pushNamed(context, '/');
      //     },
      //   ),
      // ),
      body:
      Container(
          height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/im2.jpg"), fit: BoxFit.cover)          
            ),
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),

          child: ListView(
            children: [
              // Text("PHI Registration", style: TextStyle(
              //     color: Colors.green,
              //     fontSize: 25, fontWeight: FontWeight.w500),
              // ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor
                          ),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset:Offset(0,10)
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://cdn0.iconfinder.com/data/icons/set-ui-app-android/32/8-512.png"),
                              
                          )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.blue,
                          ),
                          child: Icon(Icons.edit,color: Colors.white,)
                      ),)
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    controller: _fname,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "First Name",
                      labelStyle: TextStyle(
                          fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),

              ),
               Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    controller: _lname,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "Last Name",
                      labelStyle: TextStyle(
                          fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),

              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    controller: _age,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "Age",
                      labelStyle: TextStyle(
                          fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),

              ),
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: TextFormField(
              //       keyboardType: TextInputType.emailAddress,

              //       decoration: InputDecoration(
              //         labelText: "NIC",


              //         labelStyle: TextStyle(
              //             fontSize: 14, color: Colors.black),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(
              //             color: Colors.blue,
              //           ),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10),
              //             borderSide: BorderSide(
              //               color: Colors.blue,
              //             )),
              //       )),

              // ),
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: TextFormField(
              //       keyboardType: TextInputType.emailAddress,

              //       decoration: InputDecoration(
              //         labelText: "Address",


              //         labelStyle: TextStyle(
              //             fontSize: 14, color: Colors.black),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(
              //             color: Colors.blue,
              //           ),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10),
              //             borderSide: BorderSide(
              //               color: Colors.blue,
              //             )),
              //       )),

              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    controller: _phone,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "Contact Number",


                      labelStyle: TextStyle(
                          fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),

              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    controller: _pro,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "Profession",


                      labelStyle: TextStyle(
                          fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),

              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "Email",


                      labelStyle: TextStyle(
                          fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),

              ),



              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    controller: _ati,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "Affiliation",


                      labelStyle: TextStyle(
                          fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),

              ),
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: TextFormField(
              //       keyboardType: TextInputType.emailAddress,

              //       decoration: InputDecoration(
              //         labelText: "Current Locations",


              //         labelStyle: TextStyle(
              //             fontSize: 14, color: Colors.black),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(
              //             color: Colors.blue,
              //           ),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10),
              //             borderSide: BorderSide(
              //               color: Colors.blue,
              //             )),
              //       )),

              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                
                child: TextFormField(

                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "Current Passward",


                      labelStyle: TextStyle(
                          fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),

              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                
                child: TextFormField(
                    controller: _password,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "New Passward",


                      labelStyle: TextStyle(
                          fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),

              ),

              // buildTextField("First Name", "Enter First Name",false),
              // buildTextField("Last Name", "Enter Last Name", false),
              // buildTextField("Current Password", "Enter Current Password",true),
              // buildTextField("New Password", "***", true),
              // buildTextField("Email", "Enter Email",false),
              // buildTextField("NIC", "NIC", false),

              SizedBox(
                height:25,
              ),//SizeBox
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // OutlineButton(
                  //   padding: EdgeInsets.symmetric(horizontal: 50),
                  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),//RoundedRectangleBorder
                  //   onPressed: (){},
                  //   child: Text("CANCEL",
                  //       style:TextStyle(
                  //           fontSize: 14,
                  //           letterSpacing: 2.2,
                  //           color: Colors.black)),

                  // ),
                  // SizedBox(
                  //    width: 19,
                  // ),
                  RaisedButton(
                      onPressed: () async {
                        if (_fname == null ||
                            _lname == null ||
                            _age == null ||
                            _ati == null||
                            _pro == null||
                            _address == null ||
                            _email == null ||
                            _phone == null ||
                            _password == null) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Registration  Failed!!',
                            desc: 'All Fields Required..',
                            btnCancelOnPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CitiDashProPage()));
                            },
                            btnOkOnPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CitiDashProPage()));
                            },
                          )..show();
                        } else {
                          CitizenUpdate(_fname.text,_lname.text, _age.text,_phone.text, _pro.text, _email.text, _ati.text,_password.text);
                        }
                      },
                      color: Colors.blue.shade900,
                      padding: EdgeInsets.symmetric(horizontal:50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),//RoundRectangleBorder
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      )
                  ),

                  RaisedButton(
                      onPressed: () async {
                        if (_fname == null ||
                            _lname == null ||
                            _age == null ||
                            _ati == null||
                            _pro == null||
                            _address == null ||
                            _email == null ||
                            _phone == null ||
                            _password == null) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Registration  Failed!!',
                            desc: 'All Fields Required..',
                            btnCancelOnPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CitiDashProPage()));
                            },
                            btnOkOnPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CitiDashProPage()));
                            },
                          )..show();
                        } else {
                          CitizenUpdate(_fname.text,_lname.text, _age.text,_phone.text, _pro.text, _email.text, _ati.text,_password.text);
                        }
                      },
                      color: Colors.blue.shade900,
                      padding: EdgeInsets.symmetric(horizontal:50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),//RoundRectangleBorder
                      child: Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      )
                  ),
                  // SizedBox(
                  //   height:30,
                  // ),
          //          Center(
          // child: new InkWell(
          //     child: new Text('Login', style: TextStyle(color:Colors.blue.shade900,fontSize: 16),),
          //     onTap: () => {
          //        Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => LoginPage()),
          //               )
          //     },
          // ),
          //          ),
                ],
              )
            ],
          ),
        ),
         drawer: CitiDrawer(),
      
    );
  }

  // Widget buildTextField(
  //     String labelText, String placeholder,bool isPasswordTextField) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom :35.0),
  //     child: TextField(
  //       obscureText: isPasswordTextField? showPassword : false,
  //       decoration: InputDecoration(
  //           suffixIcon: isPasswordTextField ?
  //           IconButton(
  //             onPressed: (){
  //               setState(() {
  //                 showPassword = showPassword;
  //               });
  //             },
  //             icon: Icon(
  //               Icons.remove_red_eye,
  //               color: Colors.greenAccent,
  //             ),

  //           ):null,
  //           contentPadding: EdgeInsets.only(bottom: 3),
  //           labelText: "First Name",
  //           floatingLabelBehavior: FloatingLabelBehavior.always,
  //           hintText: "Enter First Name ",
  //           hintStyle: TextStyle(
  //             fontSize: 14, fontWeight: FontWeight.bold,
  //             color: Colors.black,
  //           )
  //       ),

  //     ),
  //   );

  // }
}