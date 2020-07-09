import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/airport_model.dart';
import 'package:tablet_app/screens/navdb/search_screens/cas_search_screen.dart';
import 'package:tablet_app/screens/navdb/search_screens/airport_expansion_tile.dart';
import 'package:tablet_app/values/tablet_theme.dart';
import 'package:tablet_app/values/theme.dart';



class AirportSearchScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AirportSearchScreenState();
  }

}

class _AirportSearchScreenState extends State{

  TextEditingController nameController = new TextEditingController();
  TextEditingController typeController = new TextEditingController();
  TextEditingController classificationController = new TextEditingController();
  String nameFilter;
  String typeFilter;
  String classificationFilter;

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      setState(() {
        nameFilter = nameController.text;
        typeFilter = typeController.text;
        classificationFilter = classificationController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    var heightContext = MediaQuery.of(context).size.height;
    var widthContext = MediaQuery.of(context).size.width;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;

    return Scaffold(
      body: Container(
        height: heightContext,
        width: widthContext,
        decoration: BoxDecoration(
          color: drawerBackgroundColor,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverMultilineAppBar(
              title: 'Airport',
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if(useMobileLayout){

                    return nameFilter == null || nameFilter == ""
                        ? getAirportExpansionTileForMobile(extensionTileFontSize, airportList[index])
                        : airportList[index]
                        .name
                        .toLowerCase()
                        .contains(nameFilter.toLowerCase())
                        ? getAirportExpansionTileForMobile(extensionTileFontSize, airportList[index])
                        : new Container();
                  }else{

                    return nameFilter == null || nameFilter == ""
                        ? getAirportExpansionTileForTablet(extensionTileFontSize, airportList[index])
                        : airportList[index]
                        .name
                        .toLowerCase()
                        .contains(nameFilter.toLowerCase())
                        ? getAirportExpansionTileForTablet(extensionTileFontSize, airportList[index])
                        : new Container();
                  }

                }, childCount: airportList.length)
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }





}