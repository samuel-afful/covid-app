import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'datasource.dart';
import 'faqs.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Faqs()) );
          },
                  child: Container(
            padding: EdgeInsets.all(5),
            margin:EdgeInsets.all(5),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('FAQS',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward,color: Colors.white)
            ],),
          ),
        ),
        GestureDetector(
          onTap: (){
            launch('https://www.who.int/');
          },
            child: Container(
            padding: EdgeInsets.all(5),
            margin:EdgeInsets.all(5),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('MYTHS BUSTERS',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward,color: Colors.white)
            ],),
          ),
        ),
       
      ],
    );
  }
}