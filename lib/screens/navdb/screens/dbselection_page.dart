import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../values/theme.dart';


enum SelectionCharacter { dafif, jeppesen }

class DatabaseSelection extends StatefulWidget{
  static const routeName = "/dbselection";
  @override
  State<StatefulWidget> createState() {
    return _DatabaseSelection();
  }

}

class _DatabaseSelection extends State<DatabaseSelection> with WidgetsBindingObserver {

  SelectionCharacter _character = SelectionCharacter.jeppesen;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DB Selection",
          style: defaultWhiteTitleStyle,
        ),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    if (MediaQuery
        .of(context)
        .orientation == Orientation.portrait) {
      return _buildVerticalLayout();
    } else {
      return _buildVerticalLayout();
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
      child: Theme(
        data: ThemeData(
            textTheme: TextTheme(
                subhead: TextStyle(
                    color: Colors.white
                )),
        ),
        child: Column(
            children: <Widget>[
              ListTile(
                title: const Text('DAFIF'),
                leading: Radio(
                  value: SelectionCharacter.dafif,
                  groupValue: _character,
                  onChanged: (SelectionCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('JEPPESEN'),
                leading: Radio(
                  value: SelectionCharacter.jeppesen,
                  groupValue: _character,
                  onChanged: (SelectionCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }

  }



