
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/coordinate.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/screens/navdb/widgets/flutter_masked_text.dart';

class RegionalSearchScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return CoordinateList();
  }


}

class CoordinateList extends StatefulWidget{

  var controller = new MaskedTextController(mask: "43°00'00.00\"K,026°00'00.00\"D");

  @override
  State<StatefulWidget> createState() {
    return _CoordinateListState();
  }
}

class _CoordinateListState extends State{

  List<Coordinate> coordinates = [
    new Coordinate(8, 9),
    new Coordinate(8, 9),
    new Coordinate(8, 9)];

  void _addCoordinate(Coordinate coordinate){
    setState(() {
      coordinates.add(coordinate);
    });
  }

  Widget _buildCoordinateList(){
    return new ListView.builder(
        itemBuilder: (context, index){
          if(index < coordinates.length){
            return _buildCoordinateItem(coordinates[index], context);
          }
          return new Container();
      },
    );
  }

  Widget _buildCoordinateItem(Coordinate coordinate, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return new ListTile(
      title: new Container(
        height: 400,
        width: width,
        child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 3,
                    child: TextField()
                )
                ,
                Expanded(
                  flex: 1,
                  child: SizedBox(height: 20.0,),
                ),
                Expanded(
                  flex: 3,
                    child: TextField()
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

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 400,
      width: 550,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 4,
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