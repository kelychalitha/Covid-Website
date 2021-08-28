import 'package:flutter/material.dart';

import '../citizenadminview.dart';
import '../phihealthstatus.dart';
import '../positiveadmin.dart';
class Messages extends StatelessWidget {

  final List list;
  Messages({this.list});


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
                  leading: Icon(Icons.message),
                  title: new  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text: "Name:\t" + list[i]['name'].toString(),

                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13),
                        children: [
                          TextSpan(
                              text: "\nEmail:\t" + list[i]['email'].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13)),
                          TextSpan(
                              text: "\nMessage:\t" + list[i]['message'].toString(),
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
