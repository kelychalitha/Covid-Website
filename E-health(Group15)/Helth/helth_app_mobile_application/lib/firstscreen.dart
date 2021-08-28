import 'package:flutter/material.dart';

import 'firstmenupage.dart';






class FScreenPage extends StatefulWidget {
 FScreenPage({Key key }) : super(key: key);

 

 

  @override
  _FScreenPageState createState() => _FScreenPageState();
}

class _FScreenPageState extends State<FScreenPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Future.delayed(Duration(seconds: 3),
     (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> FirstMenuPage()));
     }
    );
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(

      body:
      SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width:  MediaQuery.of(context).size.width ,
                // color: Colors.blue[900],
                decoration: BoxDecoration(
                  gradient:LinearGradient(colors: <Color>[
                    
                    Color(0xffFFE082),
                    Colors.blue[900],

                  ])
                ),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                child:  Image.asset('images/logo.jpeg'),
                width: 180,

              ),
              
            ],
          ),

          ),
      ),

    );
  }
}
