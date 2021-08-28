import 'package:flutter/material.dart';

class CitizenVisitsLists extends StatelessWidget {

  final List list;
  CitizenVisitsLists ({this.list});


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
                  leading: Icon(Icons.place),
                  title: new  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text: "Visit Place:\t\t" + list[i]['location'].toString(),

                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13),
                        children: [

                          TextSpan(
                              text: "\nDate\t\t\t" + list[i]['date'].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13)),
                          TextSpan(
                              text: "\nTime:\t\t\t" + list[i]['cTime'].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13)),
                        ]
                    ),

                  ),

        )
              )

        );
      },

    );
  }
}
