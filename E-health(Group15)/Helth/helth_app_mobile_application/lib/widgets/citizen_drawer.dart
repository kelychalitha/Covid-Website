import 'package:flutter/material.dart';
import 'package:health_care/widgets/state.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:health_care/phiadminview.dart';

import '../QrScan.dart';
import '../citi.dart';
import '../citiHelthList.dart';
import '../citidashpro.dart';
import '../citihealth.dart';
import '../citivisit.dart';
import '../dashboard.dart';
import '../firstscreen.dart';
import '../visitList.dart';
// import '../citizenadminview.dart';
// import '../dashboard.dart';
// import '../firstscreen.dart';
// import '../positiveadmin.dart';
// import '../table1.dart';

class CitiDrawer extends StatelessWidget {
  const CitiDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fname, lname, ge, contct, prof, mail, aff, address;
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              // Color(0xffFFE082),
              // Color(0xff795548)
              Colors.lightBlue[900],
              Colors.grey[600]
            ])),

//             child: Container(
//   alignment: Alignment.center,
//   child: Container(
//   width: 100.0,
//   height: 100.0,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(30.0),
//     image: DecorationImage(
//       image: NetworkImage(
//         "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
        
//       ), fit: BoxFit.cover)
//     ),
//   ),
// ),
            child: Container(
              child: Column(
                children: [
                  Material(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      child: Padding(
                        padding: EdgeInsets.all(13.0),
                        child: Image.asset(
                          'images/logo.jpeg',
                          width: 100,
                          height: 100,
                        ),
                      ))
                ],
              ),
            )
            ),

        //  CustomListTitle(Icons.person,"Profile",()=>{
        //    Navigator.push(
        //               context,
        //               MaterialPageRoute(builder: (context) => ProfilePage()),
        //             )
        //  }),

        // CustomListTitle(Icons.apps,"Services",()=>{
        //    Navigator.push(
        //               context,
        //               MaterialPageRoute(builder: (context) => MainMenuPage()),
        //             )
        // },
        // ),
        CustomListTitle(
            Icons.grid_on,
            "Dash Board",
            () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashBoardCitiPage()),
                  )
                }),
        CustomListTitle(Icons.grid_on, "Profile", () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          fname = prefs.getString('fname');
          lname = prefs.getString('lname');
          ge = prefs.getString('age');
          contct = prefs.getString('phone');
          prof = prefs.getString('prof');
          mail = prefs.getString('userEmail1');
          aff = prefs.getString('affilication');
          address = prefs.getString('address');
          print(fname);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CitiDashProPage(
                    fname: fname,
                    lname: lname,
                    ge: ge,
                    contct: contct,
                    prof: prof,
                    mail: mail,
                    aff: aff,
                    address: address)),
          );
        }),
        CustomListTitle(
            Icons.grid_on,
            "Health Status",
            () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CitiHealthListPage()),
                  )
                }),

        CustomListTitle(
            Icons.contact_page,
            "Citizen Visit",
            () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CitiVisitPageList()),
                  )
                }),
        CustomListTitle(
            Icons.qr_code,
            "QR Scan",
            () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRScan()),
                  )
                }),

        CustomListTitle(
            Icons.logout,
            "LogOut",
            () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Logout()),
                  )
                }),
      ],
    ));
  }
}
