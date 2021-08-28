
import 'package:flutter/material.dart';
import 'package:health_care/citireg.dart';
import 'package:health_care/login.dart';
import 'package:health_care/phireg.dart';

import 'about.dart';
import 'admin-login.dart';
import 'contactus.dart';



// import 'hospitality.dart';
class FirstMenuPage extends StatefulWidget {
  FirstMenuPage({Key key, this.title}) : super(key: key);

 

  final String title;

  @override
  _FirstMenuPageState createState() => _FirstMenuPageState();
}

class _FirstMenuPageState extends State<FirstMenuPage> {


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(

      body:
      
      SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width:  MediaQuery.of(context).size.width ,
                // color: Color(0xffD7CCC8),
          decoration: BoxDecoration(
            image: DecorationImage(
                  image: AssetImage("images/c3.jpg"), fit: BoxFit.cover)          
          ),
          child: Column(
            children: [
              SizedBox(height: 70),
              Container(
                child:  Image.asset('images/logo.jpeg'),
                width: 100,

              ),
              SizedBox(height: 40,),

              InkWell(
                onTap: (){
                  
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                        );
                },
                child: Container(
                  height: 70,
                  width:  MediaQuery.of(context).size.width - 80 ,
                  color: Color(0xff023e8a),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20,),
                      Container(
                        width: 30,
                        child: Icon(
                          Icons.apps),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width - 150 ,
                            child: Center(child: Text("About Us",style: TextStyle(fontSize: 17),)),
                          ),
                    ],
                  ),

                ),
              ),

              SizedBox(height: 40,),


              InkWell(
                onTap: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactPage()),
                        );

                },
                  child: Container(
                  height: 70,
                  width:  MediaQuery.of(context).size.width - 80 ,
                  color: Color(0xff023e8a),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20,),
                      Container(
                        width: 30,
                        child: Icon(
                          Icons.apps),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width - 150 ,
                            child: Center(child: Text("Contact Us",style: TextStyle(fontSize: 17))),
                          ),
                    ],
                  ),

                ),
              ),


                  SizedBox(height: 40,),

              InkWell(
                onTap: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhiRegPage()),
                        );
                  
                },
                              child: Container(
                  height: 70,
                  width:  MediaQuery.of(context).size.width - 80 ,
                  color: Color(0xffef233c),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20,),
                      Container(
                        width: 30,
                        child: Icon(
                          Icons.apps),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width - 150 ,
                            child: Center(child: Text("PHI Register",style: TextStyle(fontSize: 17))),
                          ),
                    ],
                  ),

                ),
              ),


                  SizedBox(height: 40,),

              InkWell(
                onTap: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CitiRegPage()),
                  );
                  
                },
                              child: Container(
                  height: 70,
                  width:  MediaQuery.of(context).size.width - 80 ,
                  color: Color(0xffef233c),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20,),
                      Container(
                        width: 30,
                        child: Icon(
                          Icons.apps),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width - 150 ,
                            child: Center(child: Text("Citizen Register",style: TextStyle(fontSize: 17))),
                          ),
                    ],
                  ),

                ),
              ),



                  SizedBox(height: 40,),

              InkWell(
                onTap: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminLoginPage()),
                  );
                  
                },
                              child: Container(
                  height: 70,
                  width:  MediaQuery.of(context).size.width - 80 ,
                  color: Color(0xfffb5607),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20,),
                      Container(
                        width: 30,
                        child: Icon(
                          Icons.apps),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width - 150 ,
                            child: Center(child: Text("Login",style: TextStyle(fontSize: 17))),
                          ),
                    ],
                  ),

                ),
              ),





     
            ],
          ),

          ),
      ),


    );
  }
}
