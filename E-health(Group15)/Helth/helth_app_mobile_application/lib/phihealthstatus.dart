import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care/phiCitiHelthVisitList.dart';
import 'package:http/http.dart' as http;
import 'package:health_care/widgets/phi_drawer.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/connection.dart';
import 'citiVisitListCitizen.dart';
import 'dashphi.dart';

class PhiHealthPage extends StatefulWidget {
  List list;
  int index;
  PhiHealthPage({this.index, this.list});
  @override
  _PhiHealthPageState createState() => _PhiHealthPageState();
}

class _PhiHealthPageState extends State<PhiHealthPage> {
  bool showPassword = false;
  final ScrollController _scrollController = ScrollController();

  String selectedDate  =  '';
  List <String> testList = ["Select","PCR","Antigen"];
  String selectTest = "Select";

  List <String> resultList = ["Select","Positive","Negative","Deceased","Recoverd"];
  String selectresult = 'Select';

    void _showStartTimePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 205,
              color: Color(0xffe8ffff),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newDateTime) {
                        print("========== delected date ====");
                        print(newDateTime);
                        String formattedDate = DateFormat('yyyy/MM/dd').format(newDateTime);
                        selectedDate = formattedDate;
                      },
                      use24hFormat: true,
                      minuteInterval: 1,
                    ),
                  ),

                  // Close the modal
                  CupertinoButton(
                      child: Text(
                        'OK',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.red,
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {
                        setState(() {
                          // print(_selectedStartTime);
                          selectedDate = selectedDate;
                        });

                        Navigator.of(ctx).pop();
                      })
                ],
              ),
            ));
  }
  Future<String>  addReport(id, results, test, nic, date) async {
      print("\n\n\n" +id + "\n" + results + "\n" + test + "\n" + nic + "\n" + date);
    var ip = Configuration.base_url;
    var url = "$ip/citizen/addCitizenReport/"; //
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
      'id': id ,
      'results': results,
      'test': test,
      'nic': nic,
        'date': date
      }),
    );


    var parse = response.statusCode;

    if (parse == 200) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => DashBoardPhiPage()),
              (Route<dynamic> route) => false);
    }
    else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Report Update Fail!!',
        desc: 'Something goes Wrong..',
        btnCancelOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DashBoardPhiPage()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DashBoardPhiPage()));
        },
      )
        ..show();
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenwidth =  MediaQuery.of(context).size.width;
    var nic = "${widget.list[widget.index]['nic']}";
    var id = "${widget.list[widget.index]['_id']}";
    var _nic;
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.blue[700],
      ),
     
    body: 
    Container(
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
    Text("Citizen Health Status", style: TextStyle(
    color: Colors.black,
    fontSize: 25, fontWeight: FontWeight.w900),
    ),
    SizedBox(
      height:20,
    ),
   
    Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(children:[

              Expanded(child:
              Container(
                margin:EdgeInsets.only(left:4,right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '  Search NIC'
                  ),
                  onChanged: (value){
                    _nic = value;
                  },
                ),
              ),   
              ),
              IconButton(icon: Icon(Icons.search), onPressed:()  async {

                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('search-key',_nic);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhiHealthPageList())
                );
              },),
            ]),
          ),
          SizedBox(
      height:30,
    ),
      
      Container(
      width: screenwidth,
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50 ),
      decoration: BoxDecoration(color: Colors.black,
                borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("First Name", style: TextStyle(color: Colors.white),),
              

              Text("${widget.list[widget.index]['fname']}", style: TextStyle(color: Colors.white),),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Last Name", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['lname']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
           SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("NIC", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['nic']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
           SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Age ", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['age']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
           SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Address ", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['address']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
           SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Profession", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['profeson']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
           SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Email", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['email']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
           SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Affiliation", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['affilication']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
           SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Current Location ", style: TextStyle(color: Colors.white),),

              Text("${widget.list[widget.index]['location']}", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date ", style: TextStyle(color: Colors.white),),

              InkWell(
                onTap: (){
                  print("==== date===");
                  _showStartTimePicker(context);
                },
                child: Text((selectedDate == "") ? "Select" : selectedDate, style: TextStyle(color: Colors.white),)),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Test", style: TextStyle(color: Colors.white),),
              Container(
                height: 20,
               child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          dropdownColor: Colors.grey[850],
                          hint: Text("Select",
                            style: TextStyle(color: Colors.white),) ,  
                          value: selectTest,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (newValue) {
                            setState(() {
                              selectTest = newValue;
                            });
                          },
                          items: testList.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),),
               )
              ),

              // Text("", style: TextStyle(color: Colors.white),),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Result ", style: TextStyle(color: Colors.white),),

              Container(
                height: 20,
               child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          dropdownColor: Colors.grey[850],
                          hint: Text("Select",
                            style: TextStyle(color: Colors.white),) ,  
                          value: selectresult,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (newValue) {
                            setState(() {
                              selectresult = newValue;
                            });
                          },
                          items: resultList
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),),
               )
              ),
            ],
          ),
           Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 80,
            // height: 20,
            // color: Colors.grey,
            child: RaisedButton(
              onPressed: (){
                addReport(id,  selectresult, selectTest, nic , selectedDate );

//print(nic + "\nNIC:" + id + "\n" + selectedDate + "\n" + selectresult + "\n" + selectTest );
              },
              color: Colors.grey,
              child: Text("Update"),),
          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Update", style: TextStyle(color: Colors.white),),

          //     Text("", style: TextStyle(color: Colors.white),),
          //   ],
          // ),
        ],
      ),

      
    ),
     SizedBox(
       
            height: 15,
          ),

    ]
    ),
      ),
        ),

         drawer: PhiDrawer(),
    );
      
  }
}