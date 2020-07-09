import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/firuir_model.dart';
import 'package:tablet_app/screens/navdb/search_screens/filter_text_field.dart';

import '../../../values/theme.dart';
import '../../../values/tablet_theme.dart';

class FirUirScreen extends StatefulWidget {
  static const routeName = "/airways";
  @override
  State<StatefulWidget> createState() {
    return _FirUirScreenState();
  }
}

class _FirUirScreenState extends State<FirUirScreen>  with WidgetsBindingObserver {
//  WidgetsBindingObserver starts listening in the initState method.
  TextEditingController controller = new TextEditingController();
  String filter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  "Fir/Uirs",
                  style: defaultWhiteTitleStyle,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: FilterTextField(
                    controller: controller,
                    isNumber: false,
                    labelText: "Identifier",
                  )
              ),

            ]),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;
    if(useMobileLayout){
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        return _buildVerticalLayout();
      } else {
        return _buildVerticalLayout();
      }
    }else{
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        return _buildTableVerticalLayout();
      } else {
        return _buildTableHorizontalLayout();
      }
    }
  }


  Widget _buildVerticalLayout() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
            itemCount: firUirList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var extensionTileFontSize = 14.0;
              return filter == null || filter == "" ?
              getExpansionTile(extensionTileFontSize, index)
                  :
              firUirList[index].identifier.toLowerCase().contains(filter.toLowerCase()) ?
              getExpansionTile(extensionTileFontSize, index)
                  :
              new Container();
            }),
      ),
    );
  }

  Widget _buildTableVerticalLayout() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
            itemCount: firUirList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var extensionTileFontSize = 14.0;
              return filter == null || filter == "" ?
              getExpansionTile(extensionTileFontSize, index)
                  :
              firUirList[index].identifier.toLowerCase().contains(filter.toLowerCase()) ?
              getExpansionTile(extensionTileFontSize, index)
                  :
              new Container();
            }),
      ),
    );
  }

  Widget _buildTableHorizontalLayout() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
            itemCount: firUirList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return filter == null || filter == "" ?
              getExpansionTile(extensionTileFontSize, index)
                  :
              firUirList[index].identifier.toLowerCase().contains(filter.toLowerCase()) ?
              getExpansionTile(extensionTileFontSize, index)
                  :
              new Container();
            }),
      ),
    );
  }

  DefaultTextStyle getExpansionTile(double extensionTileFontSize, int index) {
    return DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: extensionTileFontSize,
              ),
              child: Theme(
                data: ThemeData(
                    textTheme: TextTheme(
                        subhead: TextStyle(
                            color: Colors.white
                        ))
                ),
                child: ExpansionTile(
                  key: PageStorageKey<String>(firUirList[index].identifier),
                  title: Text('${firUirList[index].identifier}'),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: extensionTileFontSize, bottom: extensionTileFontSize),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[


                                  Text('Identifier: ${firUirList[index].identifier}'),
                                  SizedBox(width: extensionTileFontSize,),
                                  Text('Name: ${firUirList[index].name}'),


                          ]
                      ),
                    ),

                  ],

                ),
              ),
            );
  }
}


