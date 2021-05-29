import 'dart:convert';
import 'dart:ui';
import 'package:api/datasource.dart';
import 'package:api/ghana.dart';
import 'package:api/worldpanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:theme_manager/theme_manager.dart';
import 'countries.dart';
import 'countryInfo.dart';
import 'infopanel.dart';
import 'mostedaffected.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map worldData;
  List countryData;
  Map ghData;
  fetchWorldWideData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
      print(worldData);
    });

  }

  mostAffectedData()async{
     http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }


  ghanaData()async{
     http.Response response = await http.get('https://corona.lmao.ninja/v2/countries/ghana');
    setState(() {
      ghData = json.decode(response.body);
    });
  }

  @override
  void initState() {
  
  fetchWorldWideData();
  mostAffectedData();
  ghanaData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        
        centerTitle: false,
        title: Text("COVID-19 TRACKER"),
        actions: [
                      
               IconButton(icon: Icon(Icons.settings),onPressed:(){
                 //Changing font Size of Text
                  setState(() {
                    textSize++;
                  });
               }
               
               ),
          
              IconButton(icon: Icon(Theme.of(context).brightness == Brightness.light?Icons.lightbulb_outline:Icons.highlight), 
              onPressed:(){
              
                
                 ThemeManager.of(context)
                      .setBrightnessPreference(Theme.of(context).brightness==Brightness.light?BrightnessPreference.light:BrightnessPreference.dark);
                

              })
           
           
          
         
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ghData == null? CircularProgressIndicator():GhanaData(ghData:ghData),
            
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('World-Wide-Panel',style: TextStyle(fontSize:20, fontWeight:FontWeight.bold,
                     color: Theme.of(context).brightness == Brightness.light?Colors.white:Colors.black,
                     ),),
                      GestureDetector(
                        child: Container(
                  height: 25,
                  width: 90,
                  //margin: EdgeInsets.all(10),
                  // padding: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                     color: Colors.blue[100],
                     borderRadius:BorderRadius.circular(15) ),
                     child: Text('Countries',textAlign: TextAlign.center ,style: TextStyle(fontSize:16, fontWeight:FontWeight.bold, color: Colors.blue),)
                     ),
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                     },
          ),
                   ],
                 ),
                 height:50,
               ),
             ),
              worldData == null ? CircularProgressIndicator(): WorldwidePanel(worldData: worldData,),
               countryData == null ? CircularProgressIndicator(): CountryData(countryData: countryData,),
               InfoPanel()
          ],
        )
        ),
    );
  }
}