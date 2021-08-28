import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:health_care/widgets/phi_drawer.dart';

class DashBoardPhiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.blue[700],
      ),
      
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   leading: IconButton(
      //     color: Colors.grey,
      //     icon: Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Navigator.pushNamed(context, '/');
      //     },
      //   ),
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  AssetImage("images/im2.jpg"),
            fit: BoxFit.cover,
          )
        ),
      
           
         child:   Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: double.maxFinite,
              child: Column(
                children: [
                   SizedBox(
                    height:30,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'If you are sick, steps to prevent the spread of COVID-19',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                          fontSize: 24.0),
                    ),
                  ),

                  SizedBox(
                    height:30,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward),
                        Text(
                          'Stay home except to get medical care',
                          style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:30,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward),
                        Text(
                          'Separate yourself from other people',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:30,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward),
                        Text(
                          'Monitor your symptoms',
                          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:30,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 05.0),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward),
                        Text(
                          'Call ahead before visiting your doctor',
                          style:  TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                        
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:30,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward),
                        Text(
                          'Get Tested',
                          style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:30,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward),
                        Text(
                          'If you are sick, wear a mask over your\n nose and mouth',
                          style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:30,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward),
                        Text(
                          'Cover your coughs and sneezes',
                          style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:30,
                  ),
                   Container(
                    margin: EdgeInsets.only(top: 5.0),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward),
                        Text(
                          'Clean all “high-touch” surfaces \n everyday',
                          style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
          // ],
        // ),
      ),
      drawer: PhiDrawer(),
    );
  }
}