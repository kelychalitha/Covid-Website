// import 'package:flutter/material.dart';

// // import 'mainmenu.dart';

// class PhiRegPage extends StatefulWidget {
//   PhiRegPage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _PhiRegPageState createState() => _PhiRegPageState();
// }

// class _PhiRegPageState extends State<PhiRegPage> {
//   // File _image:
//   // Flutter getImage(){

//   // }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       body: Container(
//        height: MediaQuery.of(context).size.height,
//         // height: MediaQuery.of(context).size.height,
//         child: SingleChildScrollView(

//         child:Container(
//           // height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//             image: AssetImage("images/phi1.jpg"), fit: BoxFit.cover)
//             ),
//             // child: SingleChildScrollView(
//                         child: Column(
//                 children: [
//         SizedBox(height: 30),
//         Container(
//           child:  Image.asset('images/logo.jpeg'),
//           width: 100,

//         ),
//          SizedBox(height: 10),
//         Container(
//           height:100,
//           width: MediaQuery.of(context).size.width,

//           child:Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children:[
//                 SizedBox(width:20),
//                 Container(
//                   width: 90,
//                   child: Text(
//                     "Full Name",
//                     style: TextStyle(fontSize: 18, color:Colors.black,fontWeight: FontWeight.bold),

//                   ),
//                 ),
//                 SizedBox(width: 50),
//                 Container(
//                   width: 180,
//                   child: TextField(
//                     decoration:InputDecoration(
//                       labelText: "Full Name",
//                       labelStyle: TextStyle(color: Colors.black),

//                       fillColor: Colors.red,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width:2.0,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color:  Color(0xff3E2723),
//                           width:2.0,
//                         ),
//                       ),

//                     ),
//                     style: TextStyle(fontSize: 16,color: Colors.black,),

//                   ),

//                 )
//               ]
//           )
//           ),
//           // SizedBox(height:00),
//           Container(
//           height:100,
//           width: MediaQuery.of(context).size.width,
//           // color:Color(0xf616161),
//           // color:Colors.black,
//           child:Row(
//               children:[
//                 SizedBox(width:20),
//                 Container(
//                   width: 90,
//                   child: Text(
//                     "NIC",
//                     style: TextStyle(fontSize: 18, color:Colors.black,fontWeight: FontWeight.bold),

//                   ),
//                 ),
//                 SizedBox(width: 50),
//                 Container(
//                   width: 180,
//                   child: TextField(
//                     decoration:InputDecoration(
//                       labelText: "NIC",
//                       labelStyle: TextStyle(color: Colors.black),

//                       fillColor: Colors.red,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width:2.0,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color:  Color(0xff3E2723),
//                           width:2.0,
//                         ),
//                       ),

//                     ),
//                     style: TextStyle(fontSize: 16,color: Colors.black),

//                   ),

//                 ),
//               ]
//           )
//           ),

//            Container(
//           height:100,
//           width: MediaQuery.of(context).size.width,
//           // color:Color(0xf616161),
//           // color:Colors.black,
//           child:Row(
//               children:[
//                 SizedBox(width:20),
//                 Container(
//                   width: 90,
//                   child: Text(
//                     "Contact Number",
//                     style: TextStyle(fontSize: 18, color:Colors.black,fontWeight: FontWeight.bold),

//                   ),
//                 ),
//                 SizedBox(width: 50),
//                 Container(
//                   width: 180,
//                   child: TextField(
//                     decoration:InputDecoration(
//                       labelText: "Contact Number",
//                       labelStyle: TextStyle(color: Colors.black),

//                       fillColor: Colors.red,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width:2.0,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color:  Color(0xff3E2723),
//                           width:2.0,
//                         ),
//                       ),

//                     ),
//                     style: TextStyle(fontSize: 16,color: Colors.black),

//                   ),

//                 ),
//               ]
//           )
//           ),

//            Container(
//           height:100,
//           width: MediaQuery.of(context).size.width,
//           // color:Color(0xf616161),
//           // color:Colors.black,
//           child:Row(
//               children:[
//                 SizedBox(width:20),
//                 Container(
//                   width: 90,
//                   child: Text(
//                     "Email",
//                     style: TextStyle(fontSize: 18, color:Colors.black,fontWeight: FontWeight.bold),

//                   ),
//                 ),
//                 SizedBox(width: 50),
//                 Container(
//                   width: 180,
//                   child: TextField(
//                     decoration:InputDecoration(
//                       labelText: "Email",
//                       labelStyle: TextStyle(color: Colors.black),

//                       fillColor: Colors.red,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width:2.0,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color:  Color(0xff3E2723),
//                           width:2.0,
//                         ),
//                       ),

//                     ),
//                     style: TextStyle(fontSize: 16,color: Colors.black),

//                   ),

//                 ),
//               ]
//           )
//           ),

//            Container(
//           height:100,
//           width: MediaQuery.of(context).size.width,
//           // color:Color(0xf616161),
//           // color:Colors.black,
//           child:Row(
//               children:[
//                 SizedBox(width:20),
//                 Container(
//                   width: 90,
//                   child: Text(
//                     "Address",
//                     style: TextStyle(fontSize: 18, color:Colors.black,fontWeight: FontWeight.bold),

//                   ),
//                 ),
//                 SizedBox(width: 50),
//                 Container(
//                   width: 180,
//                   child: TextField(
//                     decoration:InputDecoration(
//                       labelText: "Address",
//                       labelStyle: TextStyle(color: Colors.black),

//                       fillColor: Colors.red,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width:2.0,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color:  Color(0xff3E2723),
//                           width:2.0,
//                         ),
//                       ),

//                     ),
//                     style: TextStyle(fontSize: 16,color: Colors.black),

//                   ),

//                 ),
//               ]
//           )
//           ),

//            Container(
//           height:100,
//           width: MediaQuery.of(context).size.width,
//           // color:Color(0xf616161),
//           // color:Colors.black,
//           child:Row(
//               children:[
//                 SizedBox(width:20),
//                 Container(
//                   width: 90,
//                   child: Text(
//                     "Own Division",
//                     style: TextStyle(fontSize: 18, color:Colors.black,fontWeight: FontWeight.bold),

//                   ),
//                 ),
//                 SizedBox(width: 50),
//                 Container(
//                   width: 180,
//                   child: TextField(
//                     decoration:InputDecoration(
//                       labelText: "Own Division",
//                       labelStyle: TextStyle(color: Colors.black),

//                       fillColor: Colors.red,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width:2.0,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color:  Color(0xff3E2723),
//                           width:2.0,
//                         ),
//                       ),

//                     ),
//                     style: TextStyle(fontSize: 16,color: Colors.black),

//                   ),

//                 ),
//               ]
//           )
//           ),

//            Container(
//           height:100,
//           width: MediaQuery.of(context).size.width,
//           // color:Color(0xf616161),
//           // color:Colors.black,
//           child:Row(
//               children:[
//                 SizedBox(width:20),
//                 Container(
//                   width: 90,
//                   child: Text(
//                     "Passward",
//                     style: TextStyle(fontSize: 18, color:Colors.black,fontWeight: FontWeight.bold),

//                   ),
//                 ),
//                 SizedBox(width: 50),
//                 Container(
//                   width: 180,
//                   child: TextField(
//                     decoration:InputDecoration(
//                       labelText: "Passward",
//                       labelStyle: TextStyle(color: Colors.black),

//                       fillColor: Colors.red,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width:2.0,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide(
//                           color:  Color(0xff3E2723),
//                           width:2.0,
//                         ),
//                       ),

//                     ),
//                     style: TextStyle(fontSize: 16,color: Colors.black),

//                   ),

//                 ),
//               ]
//           )
//           ),

//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//                 height: 50,
//                 width:150 ,
//                 child:RaisedButton(
//                   child:
//                   Text("Sign Up", style: TextStyle(fontSize: 20),),
//                   onPressed: (){

//                       //

//                   },
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                     side: BorderSide(color: Colors.black)
//                   ),
//                   color:  Color(0xff3E2723),
//                   textColor: Colors.white,
//                   padding: EdgeInsets.all(8.0),
//                   splashColor: Colors.grey,
//                 )
//             ),
//           ),

//                 ],
//               ),
//             ),

//             // ),
//         ),
//       ),

//     );
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:health_care/controllers/auth.dart';
import 'package:health_care/dashphi.dart';
import 'package:health_care/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/connection.dart';


void main() {
  runApp(SettingsUI());
}

class SettingsUI extends StatefulWidget {
@override
_LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

//signup phi

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => DashBoardPhiPage()),
              (Route<dynamic> route) => false);
    }
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Setting UI',
      home: PhiRegPage(),
    );
  }
}

class PhiRegPage extends StatefulWidget {
  @override
  _PhiRegPageState createState() => _PhiRegPageState();
}

class _PhiRegPageState extends State<PhiRegPage> {
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _nic = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _location = TextEditingController();
  TextEditingController _password = TextEditingController();
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
 Future<String>  signup(fname,lname,nic,phone, email,address,location, password) async {
    var ip = Configuration.base_url;
    var url = "$ip/auth/phi/signup"; //
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fname': fname ,
        'lname': lname,
        'nic': nic,
        'phone': phone,
        'email': email,
        'address': address,
        'location': location,
        'password': password,
      }),
    );


    var parse =response.statusCode;

    if(parse == 201){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) =>  LoginPage()),
              (Route<dynamic> route) => false);
    }
    else{
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Registration  Failed!!',
        desc: 'Something goes Wrong..',
        btnCancelOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhiRegPage()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhiRegPage()));
        },
      )..show();
    }

  }
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
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
              image: AssetImage("images/phi1.jpg"), fit: BoxFit.cover)),
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
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://cdn0.iconfinder.com/data/icons/set-ui-app-android/32/8-512.png"),
                      )),
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
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      )),
                )
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
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
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
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
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
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
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
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
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
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
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
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
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
                labelText: "Current Location ",
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
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
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
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
            height: 25,
          ),
          //SizeBox
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
                                  builder: (context) => PhiRegPage()));
                        },
                        btnOkOnPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhiRegPage()));
                        },
                      )..show();
                    } else {
                      signup(_fname.text,_lname.text,_nic.text,_phone.text,_email.text,_address.text,_location.text,_password.text);
                    }
                  },
                  color: Colors.blue.shade900,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  //RoundRectangleBorder
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                  )),
              // SizedBox(
              //   height:30,
              // ),
              Center(
                child: new InkWell(
                  child: new Text(
                    'Login',
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 16),
                  ),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    )
                  },
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.greenAccent,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: "First Name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: "Enter First Name ",
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
