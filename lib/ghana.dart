import 'package:flutter/material.dart';


class GhanaData extends StatelessWidget {
  final Map ghData;

  const GhanaData({Key key, this.ghData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
   Container(
     child:Image.network((ghData['countryInfo']['flag']).toString(),
     height: 80.0,
     )
   ),
   Column(
    
     children: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
            height: 40,
           width: 100,
             decoration: BoxDecoration(
             color:Colors.red[100],
             borderRadius: BorderRadius.circular(5)
           ),
           child:Column(
             children: [
      Text('CONFIRMED',style:TextStyle(color: Colors.red,fontSize: 17)),
      Text(ghData['cases'].toString(),style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold) )
           ],)
         ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
            height: 40,
           width: 100,
             decoration: BoxDecoration(
             color:Colors.green[100],
             borderRadius: BorderRadius.circular(5)
           ),
           child:Column(
             children: [
      Text('RECOVERED',style:TextStyle(color: Colors.green)),
      Text(ghData['recovered'].toString(),style:TextStyle(color: Colors.green,fontWeight: FontWeight.bold))
           ],)
         ),
       )
     ],
   ),
     Column(
     children: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
            height: 40,
           width: 60,
             decoration: BoxDecoration(
             color:Colors.blue[100],
             borderRadius: BorderRadius.circular(5)
           ),
           child:Column(
             children: [
      Text('ACTIVE',style:TextStyle(color: Colors.blue)),
      Text(ghData['active'].toString(),style:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold))
           ],)
         ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           height: 40,
           width: 60,
           decoration: BoxDecoration(
             color:Colors.grey,
             borderRadius: BorderRadius.circular(5)
           ),
           child:Column(
             children: [
      Text('DEATH',style:TextStyle(color: Colors.black,fontSize: 17)),
      Text(ghData['deaths'].toString(),style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
           ],)
         ),
       )
     ],
   )
    ],),
    );
  }
}

