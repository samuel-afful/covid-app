import 'package:flutter/material.dart';


class Search extends SearchDelegate{
  final List countryList;

  Search(this.countryList);
  @override
String get searchFieldLabel => 'Search';

@override
TextStyle get searchFieldStyle => TextStyle(
  color:Colors.grey[100]
   );

@override
ThemeData appBarTheme(BuildContext context){
  final ThemeData theme = Theme.of(context).copyWith(
    textTheme:TextTheme(
      headline6:TextStyle(
        color:Colors.grey[100] 
      )
    )
  );
  
  return theme;
}
  @override
  List<Widget> buildActions(BuildContext context) {
return [IconButton(icon:Icon(Icons.clear) ,onPressed: (){
  
  query ="";

},)];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
     return IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
       Navigator.pop(context);
     });
    }
  
    @override
    Widget buildResults(BuildContext context) {
    return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
     try{
      final suggestionList =
       query.isEmpty?
      countryList:countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
    itemBuilder: (context,index){
        return Container(
          
        child: CountryInfodata(
    name:suggestionList[index]['country'] ,
    flag: suggestionList[index]['countryInfo']['flag'],
    death: suggestionList[index]['deaths'].toString(),
    newdeath: suggestionList[index]['todayDeaths'].toString(),
    cases: suggestionList[index]['cases'].toString(),
    newcases: suggestionList[index]['todayCases'].toString(),
    recovered: suggestionList[index]['recovered'].toString(),
    activecases: suggestionList[index]['active'].toString(),

          ),
          margin: EdgeInsets.symmetric(horizontal:10,vertical:10),
      
        );
      });
  }catch(err){
    print('error caught'+ err.toString());
  }
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