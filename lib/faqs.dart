import 'package:api/datasource.dart';
import 'package:flutter/material.dart';


class Faqs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title:Text('FAQS') ,),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder:( context,index){
          return ExpansionTile(
            
            title:Text(DataSource.questionAnswers[index]['question'],style:TextStyle(color:Colors.grey,fontWeight: FontWeight.bold)) ,
            children: [
             Text(DataSource.questionAnswers[index]['answer'],style:TextStyle(color:Colors.blueGrey,fontWeight: FontWeight.bold)
             )],
            );
        }),
    );
  }
}