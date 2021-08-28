import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
        child: Column(
          children: [
            Stack(children: [
              Image(image: AssetImage('images/L4.jpg'),height: 250,width:  MediaQuery.of(context).size.width),
              Opacity(
                  opacity: 0.3,
                  child: Container(
                    margin: EdgeInsets.only(top: 150.0),
                    height: 50.0,
                    width: 170.0,
                    color: Colors.black,
                  )),
                  
              Container(
                  margin: EdgeInsets.only(top: 160.0, left: 10.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "ABOUT US",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        fontSize: 30.0),
                  )),
            ]),
            SizedBox(
                    height:20,
                  ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'The Complete\n E-Health\nManagement System',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 24.0),
                    ),
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'E - Health, this is a system which is developed on behalf of the citizens and the country based on rescuing the people from covid-19 pandemic. This system updates the locations of the people where they are by scanning the QR codes on each and every location where they go. This system is productive and very easy to use for the people and get aware of the infected patients. This system have access for to main sectors of the society named as CITIZEN and PHI. First of all the citizen must register to the system by providing correct information. Once the PHI get the medical reports of the relevant person, it is updated to the system. So the relevant person and the PHI can be aware of the positive patients and take the right actions to stop the spread of the disease.',
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0),
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //     'The Mission',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.green,
                  //         fontSize: 20.0),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 5.0),
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //     'We strive to develop the most useful and practical fully integrated healthcare pharmacy information system, which is also open-source software, allowing other developers to modify, or develop it future as per the needs.',
                  //     style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0),
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //     'The Technology',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.green,
                  //         fontSize: 20.0),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 5.0),
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //     'The project development is comprised of several components, each having important and specific roles, and supported by a solid infrastructure.',
                  //     style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}