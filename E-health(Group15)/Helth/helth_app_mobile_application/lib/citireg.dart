import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:health_care/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Api/connection.dart';
import 'citi.dart';
import 'citizenLogin.dart';
void main() {
  runApp(SettingsUI());
}

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Setting UI',
      home: CitiRegPage(),
    );
  }
}

class CitiRegPage extends StatefulWidget {
  @override
  _CitiRegPageState createState() => _CitiRegPageState();
}

class _CitiRegPageState extends State<CitiRegPage>{

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token1') != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) =>  DashBoardCitiPage()),
              (Route<dynamic> route) => false);
    }
  }

   TextEditingController _fname = TextEditingController();
   TextEditingController _lname = TextEditingController();
   TextEditingController _age = TextEditingController();
   TextEditingController _nic = TextEditingController();
   TextEditingController _address = TextEditingController();
   TextEditingController _phone = TextEditingController();
   TextEditingController _pro = TextEditingController();
   TextEditingController _email = TextEditingController();
   TextEditingController _aff = TextEditingController();
   TextEditingController _location = TextEditingController();
   TextEditingController _password = TextEditingController();
  //signup citizen

  Future<String>  signupCitizen(fname,lname, age,nic,address,phone, profession, email, affilliaction, location, password) async {
    var ip = Configuration.base_url;
    var url = "$ip/auth/citizen/signup"; //
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fname': fname ,
        'lname': lname,
        'nic': nic,
        'age': age,
        'profeson': profession,
        'affilication': affilliaction,
        'phone': phone,
        'email': email,
        'address': address,
        'location': location,
        'password': password,
      }),
    );


    var parse =response.statusCode;

    if(parse == 201){
      print(parse);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => CitizenLogin()),
              (Route<dynamic> route) => false);
    }
    else{
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Registration  Failed!!',
        desc: 'Something is Wrong!!..',
        btnCancelOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CitiRegPage()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CitiRegPage()));
        },
      )..show();
    }

  }


  bool showPassword = false;
  @override
  Widget build(BuildContext context){
    var fname, lname, nic, phone, email, address, location, password, age, pro, aff;
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: Colors.green,
        //     ),
        //     onPressed: (){},
        //   ),
        // ),
        body: Container(
          height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/phi1.jpg"), fit: BoxFit.cover)          
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
                    ),

                ),

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
                    ),

                ),

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
                    ),

                ),

              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _nic,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "NIC",


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
                    ),

                ),

              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _address,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "Address",


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
                    ),

                ),

              ),
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
                    ),

                ),

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
                    ),

                ),

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
                    ),

                ),

              ),



              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _aff,
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
                    ),

                ),

              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _location,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "Current Locations",


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
                    ),

                ),

              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                
                child: TextFormField(
                  controller: _password,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "Passward",


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
                    ),

                ),

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
                            _nic == null ||
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
                                      builder: (context) => CitiRegPage()));
                            },
                            btnOkOnPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CitiRegPage()));
                            },
                          )..show();
                        } else {
                          signupCitizen(_fname.text,_lname.text,_age.text,_nic.text,_address.text,_phone.text,_pro.text,_email.text,_aff.text,_location.text,_password.text);

                        }
                      },
                      color: Colors.blue.shade900,
                      padding: EdgeInsets.symmetric(horizontal:50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),//RoundRectangleBorder
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      )
                  ),
                  // SizedBox(
                  //   height:30,
                  // ),
                   Center(
          child: new InkWell(
              child: new Text('Login', style: TextStyle(color:Colors.blue.shade900,fontSize: 16),),
              onTap: () => {
                 Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CitizenLogin()),
                        )
              },
          ),
                   ),
                ],
              )
            ],
          ),
        )
    );
  }

  Widget buildTextField(
      String labelText, String placeholder,bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom :35.0),
      child: TextField(
        obscureText: isPasswordTextField? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField ?
            IconButton(
              onPressed: (){
                setState(() {
                  showPassword = showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.greenAccent,
              ),

            ):null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: "First Name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: "Enter First Name ",
            hintStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold,
              color: Colors.black,
            )
        ),

      ),
    );

  }
}
