import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:health_care/widgets/citizen_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Api/connection.dart';
import 'dart:async';

import 'citi.dart';
class QRScan extends StatefulWidget {
  @override
  _QRScanState createState() => _QRScanState();
}
String cid,fname,lname,uemail,address,phone,unic;
class _QRScanState extends State<QRScan> {

  void initState() {
    super.initState();
    user ();
    super.initState();

  }
  user () async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _cid= prefs.getString("cid");
    cid = _cid;
fname =  prefs.getString("fname");
lname =  prefs.getString("lname");
uemail =  prefs.getString("userEmail1");
address =  prefs.getString("address");
phone =  prefs.getString("phone");
unic =  prefs.getString("unic");
    setState(() {});

  }

  addPlace(location) async {
    print("Hello World\n\n" + location);
    var ip = Configuration.base_url;
    var url = "$ip/place/AddVisit"; //
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fname': fname ,
        'lname': lname,
        'nic': unic,
        'phone': phone,
        'email': uemail,
        'address': address,
        'location': location
      }),
    );


    var parse =response.statusCode;

    if(parse == 200){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) =>  DashBoardCitiPage()),
              (Route<dynamic> route) => false);
    }
    else{
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Place Adding  Failed!!',
        desc: 'Something goes Wrong..',
        btnCancelOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QRScan()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QRScan()));
        },
      )..show();
    }
  }

  String result = "Hey there!!\nGet the Location By Scanning the QR!";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        addPlace(result);
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button\n before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }



  bool showPassword = false;
  final ScrollController _scrollController = ScrollController();

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scan"),
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
        child: Center(

        child: Text(
          result,
          style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.deepOrange),
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


      drawer: CitiDrawer(),
    );

  }
}