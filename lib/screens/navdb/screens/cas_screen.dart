import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tablet_app/screens/navdb/search_screens/cas_search_screen.dart';
import '../../../values/theme.dart';
import '../../../values/tablet_theme.dart';
import 'package:tablet_app/screens/navdb/themes/navdb_add_button.dart';
import 'package:tablet_app/screens/navdb/search_screens/cas_expansion_tile.dart';
import 'package:tablet_app/screens/navdb/models/cas_model.dart';
import 'package:tablet_app/screens/navdb/search_screens/filter_text_field.dart';

class CasScreen extends StatefulWidget {
  static const routeName = "/cas";
  @override
  State<StatefulWidget> createState() {
    return _CasScreenState();
  }
}

class _CasScreenState extends State<CasScreen>  with WidgetsBindingObserver {
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
        automaticallyImplyLeading: false,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
              flex: 3,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Cas",
                        style: defaultTableWhiteTitleStyle,
                      ),
                    ),
                    Expanded(
                        flex: 7,
                        child: FilterTextField(
                          height: 40.0,
                          width: 300.0,
                          isNumber: false,
                          labelText: 'Airport Name',
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width/2,
                )
              ),
              Expanded(
                flex: 1,
                child: Theme(
                  data: ThemeData(
                    accentColor: Colors.blueAccent
                  ),
                  child: addButton
                ),
              )
            ]),
      ),
      body: body(context),
    );
  }


  Widget body(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;

    if (useMobileLayout) {
      return _buildMobileLayout();
    }

    return _buildTabletLayout();
  }


  Widget _buildMobileLayout() {
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
            itemCount: casList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return filter == null || filter == "" ?
              getExpansionTileForMobile(extensionTileFontSize, index)
                  :
              casList[index].name.toLowerCase().contains(filter.toLowerCase()) ?
              getExpansionTileForMobile(extensionTileFontSize, index)
                  :
              new Container();
            }),
      ),
    );
  }


  Widget _buildTabletLayout() {
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
            itemCount: casList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return filter == null || filter == "" ?
              getExpansionTileForTablet(extensionTileFontSize, index)
                  :
              casList[index].name.toLowerCase().contains(filter.toLowerCase()) ?
              getExpansionTileForTablet(extensionTileFontSize, index)
                  :
              new Container();
            }),
      ),
    );
  }
}

final addButton = AddRecordWidget();

class AddRecordWidget extends StatelessWidget {

  const AddRecordWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddButtonWidget(
      fillColor: Colors.blue,
      onPressed: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return CasSearchScreen();
            });
      },
    );
  }
}