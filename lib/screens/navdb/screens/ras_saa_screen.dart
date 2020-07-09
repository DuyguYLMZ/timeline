import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/ras_saa_model.dart';
import 'package:tablet_app/screens/navdb/search_screens/filter_text_field.dart';

import '../../../values/theme.dart';

class RasSaaScreen extends StatefulWidget {
  static const routeName = "/rassaa";
  @override
  State<StatefulWidget> createState() {
    return _RasSaaScreenState();
  }
}

class _RasSaaScreenState extends State<RasSaaScreen>  with WidgetsBindingObserver {
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
                  "Ras/Saa",
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
            itemCount: rassaaList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var extensionTileFontSize = 14.0;
              return filter == null || filter == "" ?
              getExpansionTile(extensionTileFontSize, index)
                  :
              rassaaList[index].identifier.toLowerCase().contains(filter.toLowerCase()) ?
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
          key: PageStorageKey<String>(rassaaList[index].identifier),
          title: Text('${rassaaList[index].identifier}'),
          children: <Widget>[
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Name: ${rassaaList[index].name}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Type: ${rassaaList[index].type}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Valid From: ${rassaaList[index].validFrom}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Valid To: ${rassaaList[index].validTo}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Lower Limit: ${rassaaList[index].lowerLimit}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Upper Limit: ${rassaaList[index].upperLimit}'),
                        SizedBox(height: extensionTileFontSize,),
                      ],
                    ),
                  ),
                ]
            ),

          ],

        ),
      ),
    );
  }

  DefaultTextStyle getTabletExpansionTile(double extensionTileFontSize, int index) {
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
          key: PageStorageKey<String>(rassaaList[index].identifier),
          title: Text('${rassaaList[index].identifier}'),
          children: <Widget>[
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Name: ${rassaaList[index].name}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Type: ${rassaaList[index].type}'),
                        SizedBox(height: extensionTileFontSize,),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Valid From: ${rassaaList[index].validFrom}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Valid To: ${rassaaList[index].validTo}'),
                        SizedBox(height: extensionTileFontSize,),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Lower Limit: ${rassaaList[index].lowerLimit}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Upper Limit: ${rassaaList[index].upperLimit}'),
                        SizedBox(height: extensionTileFontSize,),
                      ],
                    ),
                  ),
                ]
            ),
          ],

        ),
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
            itemCount: rassaaList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var extensionTileFontSize = 14.0;
              return filter == null || filter == "" ?
              getTabletExpansionTile(extensionTileFontSize, index)
                  :
              rassaaList[index].identifier.toLowerCase().contains(filter.toLowerCase()) ?
              getTabletExpansionTile(extensionTileFontSize, index)
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
            itemCount: rassaaList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var extensionTileFontSize = 14.0;
              return filter == null || filter == "" ?
              getTabletExpansionTile(extensionTileFontSize, index)
                  :
              rassaaList[index].identifier.toLowerCase().contains(filter.toLowerCase()) ?
              getTabletExpansionTile(extensionTileFontSize, index)
                  :
              new Container();
            }),
      ),
    );
  }
}


