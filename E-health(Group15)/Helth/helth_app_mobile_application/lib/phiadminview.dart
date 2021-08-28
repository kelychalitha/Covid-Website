import 'package:flutter/material.dart';
import 'package:health_care/phi_view_admin.dart';
import 'package:health_care/widgets/custom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'positiveViewAdmin.dart';

class TableTwoPage extends StatefulWidget {

  List list;
  int index;
  TableTwoPage({this.index, this.list});
  @override
  _TableTwoPageState createState() => _TableTwoPageState();
}

class _TableTwoPageState extends State<TableTwoPage> {
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
    var nic;
    final screenwidth =  MediaQuery.of(context).size.width;
    return MaterialApp(
          home: Scaffold(
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
      Text("PHI View", style: TextStyle(
      color: Colors.black,
      fontSize: 25, fontWeight: FontWeight.w900),
      ),
       SizedBox(
        height:25,
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
                      nic = value;
                    },
                  ),
                ),   
                ),
                IconButton(icon: Icon(Icons.search), onPressed:()  async {

                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('search-key3',nic);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhiViewAdmin())
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
                  Text("Contact ", style: TextStyle(color: Colors.white),),

                  Text("${widget.list[widget.index]['phone']}", style: TextStyle(color: Colors.white),),
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
                  Text("Address", style: TextStyle(color: Colors.white),),

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
                  Text("Location", style: TextStyle(color: Colors.white),),

                  Text("${widget.list[widget.index]['location']}", style: TextStyle(color: Colors.white),),
                ],
              ),

              SizedBox(
                height: 5,
              ),

              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),

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
          drawer: CustomDrawer(),
      ),
    );
      
  }
}