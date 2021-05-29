import 'package:api/datasource.dart';
import 'package:flutter/material.dart';

class CountryData extends StatelessWidget {

  final List countryData;

  const CountryData({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 230.0,
          child: ListView.builder(  
            physics: NeverScrollableScrollPhysics(), 
            itemCount: 5,  
            itemBuilder: (context,index){
      return CountryInfo(
              flag: countryData[index]['countryInfo']['flag'],
              countryname: countryData[index]['country'],
              activecount: countryData[index]['cases'].toString(),  
              );
            
            },
  
          
          
              
          
             
   
          ),
        ),
      ],
    );
  }
}

class CountryInfo extends StatefulWidget {
  final String flag;
  final String countryname;
  final String activecount;
  
  const CountryInfo({Key key, this.flag, this.countryname,this.activecount}) : super(key: key);

  @override
  _CountryInfoState createState() => _CountryInfoState();
}

class _CountryInfoState extends State<CountryInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget>[
   Image.network(widget.flag,
   height: 30.0,
   width: 60.0 ,
   ),
   SizedBox(width:20.0),
   Text(widget.countryname,style:TextStyle(fontWeight: FontWeight.bold,
   color: Theme.of(context).brightness == Brightness.light?Colors.white:Colors.black,
   )),
   SizedBox(width:20.0),
     Text('Cases: '+ widget.activecount,style:TextStyle(fontWeight: FontWeight.bold,fontSize: textSize,
     color: Theme.of(context).brightness == Brightness.light?Colors.white:Colors.black,
     ))
        ]
      ),
    );
  }
}