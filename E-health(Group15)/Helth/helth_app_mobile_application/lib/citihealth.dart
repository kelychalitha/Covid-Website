import 'package:flutter/material.dart';
import 'package:health_care/widgets/citizen_drawer.dart';

class CitiHealthPage extends StatefulWidget {
  @override
  _CitiHealthPageState createState() => _CitiHealthPageState();
}

class _CitiHealthPageState extends State<CitiHealthPage> {
  bool showPassword = false;
  final ScrollController _scrollController = ScrollController();

  Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.black;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.blue[700],
      ),
     
      body:  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  AssetImage("images/im2.jpg"),
            fit: BoxFit.cover,
          )
        ),
          
          child: Container(
    padding: EdgeInsets.only(left: 16, top: 25, right: 16),

    child: ListView(
    children: [
    Text("Health Status", style: TextStyle(
    color: Colors.black,
    fontSize: 25, fontWeight: FontWeight.w900),
    ),
    SizedBox(
      height:20,
    ),
    Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(children:[
              IconButton(icon: Icon(Icons.search), onPressed:() {},),
              Expanded(child:
              Container(
                margin:EdgeInsets.only(left:4,right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '  Search NIC'
                  ),
                ),
              ),   
              ),
            ]),
          ),
          SizedBox(
      height:30,
    ),
   Scrollbar(
                    isAlwaysShown: true,
                    radius: Radius.circular(3),
                    controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
        scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: MaterialStateProperty.resolveWith(getColor),
                headingTextStyle: TextStyle(color: Colors.white),
              //  headingRowColor: Colors.blue,
              
            columns: const<DataColumn>[
              DataColumn(label: Text('Date'),tooltip: 'Date'),
              DataColumn(label: Text('Test'),tooltip: 'Test'),
              DataColumn(label: Text('Result'),tooltip: 'Result'),
             
            ],
            rows: const<DataRow>[
              DataRow(
                  cells: <DataCell>[
             
        DataCell(Text('2021/02/23'),),
        DataCell(Text('PCR'),),
        DataCell(Text('Negative'),),
        

          ],),//<DataCell>[],
              
            ],

          ),
      ),
    ),
    ]
    ),
      ),
        ),

         drawer: CitiDrawer(),
    );
      
  }
}