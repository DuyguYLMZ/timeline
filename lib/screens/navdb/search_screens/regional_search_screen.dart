
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/coordinate.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/coordinate_input.dart';


class RegionalSearchScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return CoordinateList();
  }


}

class CoordinateList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _CoordinateListState();
  }
}

class _CoordinateListState extends State{

  List<Coordinate> coordinates = [
    new Coordinate(8, 9),
    new Coordinate(8, 9),
    new Coordinate(8, 9)
  ];



  void _addCoordinate(Coordinate coordinate){
    setState(() {
      coordinates.add(coordinate);
    });
  }

  Widget _buildCoordinateList(){
/*    return new ListView.builder(
        itemBuilder: (context, index){

          if(index < coordinates.length){
             return _buildCoordinateItem(coordinates[index], context);
          }
          return Container();
      },
    );*/
return new ListView(

);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 400,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 5,
              child: _buildCoordinateList()
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                IconButton(icon: Icon(Icons.add), onPressed: () {},),
                IconButton(icon: Icon(Icons.map), onPressed: () {},),
                IconButton(icon: Icon(Icons.zoom_out_map), onPressed: () {},),
              ],
            ),
          )
        ],
      ),
    );
  }



}

class CoordinateListItem extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var degreeChar = '\u{00B0}';
    return new ListTile(
      title: new Container(
        height: 100,
        width:  width * 0.5,
        child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                flex: 4,
                child: CoordinateInput("--$degreeChar--'--,--\"K, ---$degreeChar--'--,--\"D")
            )
            ,
            Expanded(
              flex: 1,
              child: SizedBox(height: 20.0,),
            ),
            Expanded(
                flex: 4,
                child: CoordinateInput("--$degreeChar--'--,--\"K, ---$degreeChar--'--,--\"D")
            ),
            Expanded(
              flex: 1,
              child: SizedBox(height: 20.0,),
            ),
            Expanded(flex: 1,child: IconButton(icon: Icon(Icons.edit), onPressed: () {},)),
            Expanded(flex: 1,child: IconButton(icon: Icon(Icons.delete), onPressed: () {},)),
            Expanded(flex: 1,child: IconButton(icon: Icon(Icons.content_copy), onPressed: () {},)),
          ],
        ),

      ),
    );
  }



}