import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/cas_model.dart';
import 'package:tablet_app/screens/navdb/search_screens/cas_expansion_tile.dart';
import 'package:tablet_app/screens/navdb/search_screens/filter_text_field.dart';
import 'package:tablet_app/values/tablet_theme.dart';

import '../../../values/theme.dart';


class CasSearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CasSearchScreenState();
  }
}

class _CasSearchScreenState extends State<CasSearchScreen> {
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
              title: 'Cas',
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if(useMobileLayout){

                    return nameFilter == null || nameFilter == ""
                        ? getExpansionTileForMobile(extensionTileFontSize, index)
                        : casList[index]
                        .name
                        .toLowerCase()
                        .contains(nameFilter.toLowerCase())
                        ? getExpansionTileForMobile(extensionTileFontSize, index)
                        : new Container();
                  }else{

                    return nameFilter == null || nameFilter == ""
                        ? getExpansionTileForTablet(extensionTileFontSize, index)
                        : casList[index]
                        .name
                        .toLowerCase()
                        .contains(nameFilter.toLowerCase())
                        ? getExpansionTileForTablet(extensionTileFontSize, index)
                        : new Container();
                  }

            }, childCount: casList.length)
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }

  Widget body(BuildContext context) {
   /* if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return _buildVerticalLayout(context);
    } else {
      return _buildVerticalLayout(context);
    }*/
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;

    if (useMobileLayout) {
      return _buildMobileLayout(context);
    }

    return _buildTabletLayout(context);
  }

  Widget _buildMobileLayout(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
            itemCount: casList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var extensionTileFontSize = 14.0;
              return nameFilter == null || nameFilter == ""
                  ? getExpansionTileForMobile(extensionTileFontSize, index)
                  : casList[index]
                          .name
                          .toLowerCase()
                          .contains(nameFilter.toLowerCase())
                      ? getExpansionTileForMobile(extensionTileFontSize, index)
                      : new Container();
            }),
      ),
    );
  }

  Widget _buildTabletLayout(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
            itemCount: casList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var extensionTileFontSize = 14.0;
              return nameFilter == null || nameFilter == ""
                  ? getExpansionTileForTablet(extensionTileFontSize, index)
                  : casList[index]
                  .name
                  .toLowerCase()
                  .contains(nameFilter.toLowerCase())
                  ? getExpansionTileForTablet(extensionTileFontSize, index)
                  : new Container();
            }),
      ),
    );
  }




}

class SliverMultilineAppBar extends StatelessWidget {
  final String title;
  final Widget leading;
  final TextEditingController nameController;
  final TextEditingController typeController;
  final TextEditingController classController;


  SliverMultilineAppBar({this.title, this.leading, this.nameController, this.typeController, this.classController});

  @override
  Widget build(BuildContext context) {
    final List<FilterTextField> filterFieldList = [];

    final mediaQuery = MediaQuery.of(context);
    double availableWidth = mediaQuery.size.width;
    double availableHeight = mediaQuery.size.height * 0.20;

    if (leading != null) {
      availableWidth -= 32;
    }
    return SliverAppBar(
        title: Text(title),
        backgroundColor: drawerBackgroundColor,
        expandedHeight: availableHeight,
        stretch: false,
        floating: true,
        pinned: false,
        snap: false,
        forceElevated: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: FittedBox(
              fit: BoxFit.contain,
              child: buildMultilineContainer(availableWidth * 0.66, availableHeight * 0.15),
          ),
        )
    );
  }

  Widget buildMultilineContainer(double width, double height) {
    return Container(
        width: width,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FilterTextField(
                  controller: nameController,
                  isNumber: false,
                  labelText: "Name",
                  width: width * 0.3,
                  height: height,
                ),
                SizedBox(
                  width: 10.0,
                ),
                FilterTextField(
                  controller: typeController,
                  isNumber: false,
                  labelText: "Type",
                  width: width * 0.3,
                  height: height,
                ),
                SizedBox(
                  width: 10.0,
                ),
                FilterTextField(
                  controller: classController,
                  isNumber: false,
                  labelText: "Classification",
                  width: width * 0.3,
                  height: height,
                )
              ],
            ),
          ],
        )
    );
  }
}
