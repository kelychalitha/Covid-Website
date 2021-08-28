import 'package:flutter/material.dart';
import 'package:health_care/controllers/auth.dart';
import 'package:health_care/widgets/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard.dart';
// import '../phihealthstatus.dart';
import '../dashphi.dart';
import '../firstscreen.dart';
import '../phiCitiHelthVisitList.dart';
import '../phicitivisit.dart';
import '../phihealthstatus.dart';
import '../phiproedit.dart';


// import '../citizenadminview.dart';
// import '../dashboard.dart';
// import '../firstscreen.dart';
// import '../positiveadmin.dart';
// import '../table1.dart';

class PhiDrawer extends StatelessWidget {
  const PhiDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient:LinearGradient(colors: <Color>[
                  // Color(0xffFFE082),
                  // Color(0xff795548)
                   Colors.lightBlue[900],
                  Colors.grey[600]
  
              ]
              
              )
            ),

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
                    child:Padding(padding:EdgeInsets.all(13.0),
                    child: Image.asset('images/logo.jpeg',width: 100,height: 100,),
                    )

                  )

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
          CustomListTitle(Icons.grid_on,"Dash Board",()=>{
            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashBoardPhiPage()),
                  )

          }),
          CustomListTitle(Icons.grid_on,"Health Status",()=>{
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhiHealthPageList()),
                  )
          }),
          CustomListTitle(Icons.grid_on,"Citizen Visit",()=>{
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>PhiCitiVisitPage()),
                  )
          }),

          CustomListTitle(Icons.contact_page,"Profile",()=>{
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhiProEditPage()),
                  )
          }),
          
          CustomListTitle(Icons.logout,"LogOut",()=>{
            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Logout()),
                      )
          }),


        ],
        )
        );
  }
}