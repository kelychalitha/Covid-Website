import 'package:flutter/material.dart';
import 'package:health_care/widgets/custom_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

import 'Api/connection.dart';
import 'contactByEmail.dart';
class TableOnePage extends StatefulWidget {
  @override
  _TableOnePageState createState() => _TableOnePageState();
}

class _TableOnePageState extends State<TableOnePage> {
  List<ContactItems> _ContactItems;
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
  FetchmessageList() async {
    var ip = Configuration.base_url;
    var data = await http.get("$ip/contact/messages");
    var jsonData = json.decode(data.body);

    List<ContactItems> messageList = [];

    for (var u in jsonData) {
      ContactItems messsage = ContactItems(u["name"], u["email"], u["message"]);
      messageList.add( messsage);
      print( messsage.name+" "+ messsage.email+" "+ messsage.message);
    }

    this.setState(() {
      _ContactItems = messageList;
    });

  }

  @override
  void initState() {
    FetchmessageList();
  }
  @override
  Widget build(BuildContext context) {
  var uemail;
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
    Text("Contact Us Details", style: TextStyle(
    color: Colors.black,
    fontSize: 25, fontWeight: FontWeight.w900),
    ),
    
     SizedBox(
      height:25,
    ),
    // Padding(
    //         padding: const EdgeInsets.only(left: 10.0),
    //         child: Row(children:[
    //           Expanded(child:
    //           Container(
    //             margin:EdgeInsets.only(left:4,right: 20),
    //             child: TextField(
    //               decoration: InputDecoration(
    //                 hintText: '  Search Email'
    //               ),
    //               onChanged: (value){
    //                 uemail = value;
    //               },
    //             ),
    //           ),
    //           ),
    //           IconButton(icon: Icon(Icons.search), onPressed:()  async {
    //
    //             SharedPreferences prefs = await SharedPreferences.getInstance();
    //             print("email is sfsefsf"+uemail);
    //             await prefs.setString('mail',uemail);
    //             Navigator.push(
    //                 context,
    //                 MaterialPageRoute(builder: (context) => ContactByEmail())
    //             );
    //           },),
    //         ]),
    //       ),
          SizedBox(
      height:30,
    ),
   Scrollbar(
                    isAlwaysShown: true,
                    radius: Radius.circular(3),
                    controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
        scrollDirection: Axis.horizontal,
            child: DataTable(
               headingRowColor: MaterialStateProperty.resolveWith(getColor),
                headingTextStyle: TextStyle(color: Colors.white),
            columns: const<DataColumn>[
              DataColumn(label: Text('Name'),tooltip: 'Name'),
              DataColumn(label: Text('Email'),tooltip: 'Email'),
              DataColumn(label: Text('Message'),tooltip: 'Message'),
              
            ],
    rows:
    _ContactItems.isEmpty? Text("No Messages") : _ContactItems
        .map(
    ((element) => DataRow(
      cells: <DataCell>[
        DataCell(Text(element.name)),
        DataCell(Text(element.email)),
        DataCell(Text(element.message)),
      ],
    )),
    ).toList(),
          ),
      ),
    ),
    ]
    ),
      ),
        ),

        drawer: CustomDrawer(),
    );
      
  }
}

class ContactItems {
  final String name;
  final String email;
  final String message;

  ContactItems(this.name, this.email, this.message);

}