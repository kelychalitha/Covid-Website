import 'package:flutter/material.dart';
import 'package:health_care/phiadminview.dart';
import 'package:health_care/widgets/state.dart';

import '../allCitiViewAdmin.dart';
import '../citizenViewListAdmin.dart';
import '../citizenadminview.dart';
import '../contactList.dart';
import '../dashboard.dart';
import '../firstscreen.dart';
import '../phi_view_admin.dart';
import '../phiviewAll.dart';
import '../positiveViewAdmin.dart';
import '../positiveadmin.dart';
import '../table1.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

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
          CustomListTitle(Icons.grid_on,"PHI View",()=>{
            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhiViewAdminAll()),
                  )

          }),
          CustomListTitle(Icons.grid_on,"Citizen View",()=>{
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  AllCitizenViewAdmin()),
                  )
          }),
          CustomListTitle(Icons.grid_on,"Positive P",()=>{
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>PositiveViewAdmin()),
                  )
          }),

          CustomListTitle(Icons.contact_page,"Contact Us",()=>{
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUS()),
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