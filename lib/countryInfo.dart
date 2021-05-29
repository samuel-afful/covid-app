import 'dart:convert';
import 'package:api/search.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryInfo;

  fetchCountryInfo() async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries');

    setState(() {
      countryInfo = json.decode(response.body);
    });
  }
  @override
  void initState() {
      fetchCountryInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Countries Info'),
        centerTitle: true,
        actions: [
          
          IconButton(icon: Icon(Icons.search), onPressed: (){
          
           countryInfo ==null?CircularProgressIndicator(): showSearch(context: context, delegate: Search(countryInfo));
            
          
          })
        ],
      ),
      body: Center(
        child: countryInfo == null ? SpinKitFadingCube(
  color:Colors.blueAccent,
  size: 50.0,
): CountryInfoPage(countryInfo:countryInfo),
      )
    );
  }
}


class CountryInfoPage extends StatelessWidget {
  final List countryInfo;

  const CountryInfoPage({Key key, this.countryInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countryInfo.length,
    itemBuilder: (context,index){
        return Container(
          
        child: CountryInfodata(
    name:countryInfo[index]['country'] ,
    flag: countryInfo[index]['countryInfo']['flag'],
    death: countryInfo[index]['deaths'].toString(),
    newdeath: countryInfo[index]['todayDeaths'].toString(),
    cases: countryInfo[index]['cases'].toString(),
    newcases: countryInfo[index]['todayCases'].toString(),
    recovered: countryInfo[index]['recovered'].toString(),
    activecases: countryInfo[index]['active'].toString(),

          ),
          margin: EdgeInsets.symmetric(horizontal:10,vertical:10),
      
        );
      });
  }
}

class CountryInfodata extends StatelessWidget {

  final String death;
  final String newdeath;
  final String cases;
  final String newcases;
  final String activecases;
  final String recovered;
  final String name;
  final String flag;

  const CountryInfodata({Key key, this.death, this.newdeath, this.cases, this.newcases, this.activecases, this.recovered, this.name, this.flag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //color: Colors.white,
        height: 90.0,
        width: 150.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,style: TextStyle(fontWeight:FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light?Colors.white:Colors.black
                  )),
                  Image.network(flag,
                  height: 30.0,
                  width: 60.0 ,
                  )
                ],),
            ),
              Expanded(
                    child: Container(
                  child: Column(
          
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('CONFIRMED:' + cases,style: TextStyle(color: Colors.red,fontWeight:FontWeight.bold),),
                      Text('[+'+ newcases + ']',style: TextStyle(color: Colors.red,fontWeight:FontWeight.bold)),
                      Text('ACTIVE:' + activecases,style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold)),
                      Text('RECOVERED:'+recovered,style: TextStyle(color: Colors.green,fontWeight:FontWeight.bold)),
                      Text('DEATHS:'+death+'[+'+ newdeath+']',style: TextStyle(color: Colors.blueGrey,fontWeight:FontWeight.bold))
                    ],
                  ),
                ),
              )
          ]
        ),
      ),
    );
  }
}