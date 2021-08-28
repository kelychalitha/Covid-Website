import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/contact.dart';
import 'firstscreen.dart';

class ContactPage extends StatelessWidget {
  Message msg = new Message();

  @override
  Widget build(BuildContext context) {
    var name, email, message;
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
            SizedBox(
              height: 30,
            ),
            Container(
              child: Image(
                  image: AssetImage('images/CO.jpg'), height: 200, width: 400),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  hintText: 'John Doe',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'john@gmail.com',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 0.0),
              child: TextField(
                maxLines: 8,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Your Message',
                  hintText: 'Write your status here',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                onChanged: (value) {
                  message = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 22.0),
              height: 50.0,
              width: 150.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue.shade900,
                child: GestureDetector(
                  onTap: () async {
                    if (name == null || email == null || message == null) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'Message Send Failed!!',
                        desc: 'Something is Wrong.. Please Try Again..',
                        btnCancelOnPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  ContactPage()));
                        },
                        btnOkOnPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  ContactPage()));
                        },
                      )..show();
                    } else {
                      Message.addMessage(name, email, message);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String status = prefs.getString("status");

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FScreenPage()));
                    }
                  },
                  child: Center(
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(fontSize: 19.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25.0),
              alignment: Alignment.topCenter,
              child: Text(
                'Hotline : 076 4720883',
                style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              alignment: Alignment.topCenter,
              child: Text(
                'Email : ehealth1507@gmail.com',
                style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
