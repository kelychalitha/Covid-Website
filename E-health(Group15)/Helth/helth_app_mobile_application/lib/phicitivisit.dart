import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care/widgets/phi_drawer.dart';
import 'package:http/http.dart' as http;
import 'Api/connection.dart';

class PhiCitiVisitPage extends StatefulWidget {
  @override
  _PhiCitiVisitPageState createState() => _PhiCitiVisitPageState();
}

class _PhiCitiVisitPageState extends State<PhiCitiVisitPage> {
  List<PlaceItems> _Placeitems;
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
  FetchplacesList() async {
    var ip = Configuration.base_url;
    var data = await http.get("$ip/place/visits");
    var jsonData = json.decode(data.body);

    List<PlaceItems> visitList = [];

    for (var u in jsonData) {
      PlaceItems visit = PlaceItems(u["fname"],  u["lname"],u["email"], u["address"], u["nic"], u["phone"], u["date"], u["location"]);
      visitList.add( visit);
      print( visit.fname+" "+ visit.lname+" "+visit.email+" " + visit.address+" "+ visit.nic + " " + visit.phone+" "+ visit.date+" "+ visit.place);
    }

    this.setState(() {
      _Placeitems = visitList;
    });

  }

  @override
  void initState() {
    FetchplacesList();
  }
  @override
  Widget build(BuildContext context) {
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
    Text("Citizen Visit", style: TextStyle(
    color: Colors.black,
    fontSize: 25, fontWeight: FontWeight.w900),
    ),
    SizedBox(
      height:20,
    ),

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
              //  headingRowColor: Colors.blue,
              
            columns: const<DataColumn>[
             DataColumn(label: Text('First Name'),tooltip: 'First Name'),
              DataColumn(label: Text('Last Name'),tooltip: 'Last Name'),
              DataColumn(label: Text('NIC'),tooltip: 'NIC'),
              DataColumn(label: Text('Address'),tooltip: 'Address'),
              DataColumn(label: Text('Contact Number'),tooltip: 'Contact Number'),
             
              DataColumn(label: Text('Email'),tooltip: 'Email'),
             
              DataColumn(label: Text('Date'),tooltip: 'Date'),
               DataColumn(label: Text('Visit Place'),tooltip: 'Visit Place'),
             
            ],
              rows:
              _Placeitems.isEmpty? Text("No Visits Found") : _Placeitems
                  .map(
                ((element) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(element.fname)),
                    DataCell(Text(element.lname)),
                    DataCell(Text(element.nic)),
                    DataCell(Text(element.address)),
                    DataCell(Text(element.phone)),
                    DataCell(Text(element.email)),
                    DataCell(Text(element.date)),
                    DataCell(Text(element.place)),
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

         drawer: PhiDrawer(),
    );
      
  }
}


class PlaceItems {
  final String fname;
  final String lname;
  final String email;
  final String address;
  final String nic;
  final String phone;
  final String date;
  final String place;

  PlaceItems(this.fname,this.lname, this.email, this.address, this.nic, this.phone, this.date,this.place,);

}