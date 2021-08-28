import 'package:flutter/material.dart';
class MyHelth extends StatelessWidget {

  final List list;
  MyHelth({this.list});


  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      shrinkWrap: true,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(15.0),

            child: new Card(
              child: new ListTile(
                leading: Icon(Icons.medical_services),
                title: new  RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: "Date:\t" + list[i]['date'].toString(),

                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13),
                      children: [
                        TextSpan(
                            text: "\nTest:\t" + list[i]['test'].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13)),
                        TextSpan(
                            text: "\nResult:\t" + list[i]['results'].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13)),
              ]
                ),

              ),

            ),
          ),
        );
      },

    );
  }
}
