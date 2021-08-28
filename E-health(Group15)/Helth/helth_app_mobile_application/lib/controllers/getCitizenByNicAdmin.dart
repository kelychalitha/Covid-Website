import 'package:flutter/material.dart';

import '../citizenadminview.dart';
import '../phihealthstatus.dart';
class CitizenListByIdAdmin extends StatelessWidget {

  final List list;
  CitizenListByIdAdmin({this.list});


  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      shrinkWrap: true,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(15.0),
          child: new GestureDetector(
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context) => new CitizenAdminViewPage(
                    list: list,
                    index: i,
                  ),),
              ),
              child: new Card(
                child: new ListTile(
                  leading: Icon(Icons.medical_services),
                  title: new  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text: "Name:\t" + list[i]['fname']+ " " + list[i]['lname'].toString(),

                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13),
                        children: [
                          TextSpan(
                              text: "\nContact:\t" + list[i]['phone'].toString(),
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
              )
          ),
        );
      },

    );
  }
}
