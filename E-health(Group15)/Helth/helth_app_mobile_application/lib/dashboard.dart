import 'package:flutter/material.dart';
import 'package:health_care/table1.dart';
import 'package:health_care/widgets/custom_drawer.dart';

import 'firstscreen.dart';
// import 'package:marquee_flutter/marquee_flutter.dart';

// import 'fscreen.dart';
// import 'mainmenu.dart';
// import 'profile.dart';


class DashboardPage extends StatefulWidget {
  DashboardPage({Key key, this.title}) : super(key: key);

 

  final String title;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.blue[700],
      ),



      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  AssetImage("images/im2.jpg"),
            fit: BoxFit.cover,
          )
        ),
          
          
        ),


      
       





      


      













     drawer: CustomDrawer(),


    );
  }
}




class CustomListTitle extends StatelessWidget{
  IconData icon;
  String text;
  Function onTap;

  CustomListTitle(this.icon,this.text,this.onTap);


  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border:Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
          splashColor: Color(0xffFFB300),
          onTap: onTap,
          
          child: Container(
            height:60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                Row(
                  children:[
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text, style: TextStyle(fontSize:18.0 ),),
                ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
              ),
          )

        ),
      ),
    );
  }
}