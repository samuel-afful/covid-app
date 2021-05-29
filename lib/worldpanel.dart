import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2, childAspectRatio: 2),
        children:<Widget> [
         StatusPanel(
           panelcolor: Colors.red[100],
           textcolor: Colors.red,
           text: 'CONFIRMED',
           count: worldData['cases'].toString(),

         ),
         StatusPanel(
           panelcolor: Colors.blue[100],
           textcolor: Colors.blue,
           text: 'ACTIVE',
           count:  worldData['active'].toString(),
         ),
         StatusPanel(
           panelcolor: Colors.green[100],
           textcolor: Colors.green,
           text: 'RECOVERED',
           count:  worldData['recovered'].toString(),
         ),
         StatusPanel(
           panelcolor: Colors.grey,
           textcolor: Colors.black,
           text: 'DEATH',
           count:  worldData['deaths'].toString(),
         )
        ]
        ,)
    );
  }
}


class StatusPanel extends StatelessWidget {
final Color panelcolor;
  final Color textcolor;
  final String count;
  final String text;

  const StatusPanel({Key key, this.panelcolor, this.textcolor, this.count, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: panelcolor,
        height:80,
        width: width/2,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[
            Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textcolor),),
            Text(count,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textcolor))
          ],
        ),
      ),
    );
  }
}