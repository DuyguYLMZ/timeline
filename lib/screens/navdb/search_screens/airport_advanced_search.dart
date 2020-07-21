
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/search_screens/filter_text_field.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/custom_dropdownmenu.dart';

class AirportAdvancedSearch extends StatelessWidget{

  final List<DropdownMenuItem<int>> spinnerItems = [
    DropdownMenuItem<int>(
      value: 0,
      child: Text(
          'Turkey (LT)'),
    ),
    DropdownMenuItem<int>(
      value: 1,
      child: Text(
          'Tuvalu (NF)'),
    ),
    DropdownMenuItem<int>(
      value: 1,
      child: Text(
          'Taiwan (RC)'),
    )
  ];


  Widget build(BuildContext context) {
    var heightOfWidget = MediaQuery.of(context).size.height;
    var widthOfWidget  = MediaQuery.of(context).size.width;

    return Container(
      height: heightOfWidget * 0.4,
      width: widthOfWidget * 0.4,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FilterTextField(
                  labelText: 'Airport Name',
                  width: 200,
                  height: 30,
                  isNumber: false,
                ),
                SizedBox(
                  width: 50,
                ),
                CustomDropDownMenu(
                  width: 200,
                  spinnerItems: spinnerItems,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FilterTextField(
                  labelText: 'Airport Identifier',
                  width: 200,
                  height: 30,
                  isNumber: false,
                ),
                SizedBox(
                  width: 50,
                ),
                RaisedButton(
                  child: Text("Search", style: TextStyle(fontSize: 16, color: Colors.white),),
                )
              ],
            ),
          )
        ],
      )
    );
  }

}