import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../API/connection.dart';
import 'dart:convert';

class Authentication {
  static Future<String>  login(email, password) async {
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
    print(parse["name"]);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token',parse["token"]);
    await prefs.setString('userEmail',parse["email"]);
    await prefs.setString("isLoggedIn", "logged");
    await prefs.setString('search-key',null);
  }

  //signup phi


  static Future<String>  signup(fname,lname,nic,phone, email,address,location, password) async {
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
      print(parse);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('status',"success");
    }
    else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('status',"");
    }

  }
  static logout() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("isLoggedIn", "logout");
    await prefs.setString('token',null);
    await prefs.setString('search-key',null);
    await prefs.setString('user',null);

  }
  static Future<String>  update( country, contact,nic, email ) async {
    var ip = Configuration.base_url;
    var url = "$ip/users/addCustomerDetails/$email"; //
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': contact,
        'nic': nic,
      }),
    );


    var parse =response.statusCode;

    if(parse == 201){
      print(parse);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('status',"success");
    }
    else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('status',"");
    }

  }

//signup citizen

  static Future<String>  signupCitizen(fname,lname, age,nic,address,phone, profession, email, affilliaction, location, password) async {
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
      await prefs.setString('status',"success");
    }
    else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('status',"");
    }

  }


}