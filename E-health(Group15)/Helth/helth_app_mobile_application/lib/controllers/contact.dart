import 'dart:convert';
import 'package:health_care/Api/connection.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Message{
  static Future<String>  addMessage(name, email,  message) async {
    var ip = Configuration.base_url;
    print(name);
    var url = "$ip/contact/AddMessage"; //base url + end point
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'message': message
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

  static Future<String>  deleteMessage(id) async {
    var ip = Configuration.base_url;
    var url = "$ip/deleteMessage/$id"; //base url + end point
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },


    );


    var parse = response.statusCode;

    if (parse == 201) {
      print(parse);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('status', "success");
    }
    else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('status', "");
    }
  }
  static Future<String>  updateMessage(name, email, contact, message, id) async {
    var ip = Configuration.base_url;
    print(name);
    var url = "$ip/updateMessage/$id"; //base url + end point
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'contact': contact,
        'message': message
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