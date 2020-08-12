
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/widgets/flutter_multiselect.dart';
import 'package:tablet_app/values/tablet_theme.dart';
import 'package:tablet_app/widgets/common/custom_dropdownmenu.dart';

import 'filter_text_field.dart';

class AirwayAdvancedSearch extends StatelessWidget{


  final List<DropdownMenuItem<int>> directionSpinnerItems = [
    DropdownMenuItem<int>(
      value: 0,
      child: Text(
          'F'),
    ),
    DropdownMenuItem<int>(
      value: 1,
      child: Text(
          'B'),
    ),
  ];

  final List<DropdownMenuItem<int>> levelSpinnerItems = [
    DropdownMenuItem<int>(
      value: 0,
      child: Text(
          'L'),
    ),
    DropdownMenuItem<int>(
      value: 1,
      child: Text(
          'H'),
    ),
    DropdownMenuItem<int>(
      value: 2,
      child: Text(
          'B'),
    ),
  ];

  final List<DropdownMenuItem<int>> typeSpinnerItems = [
    DropdownMenuItem<int>(
      value: 0,
      child: Text(
          'R'),
    ),
    DropdownMenuItem<int>(
      value: 1,
      child: Text(
          'W'),
    ),
  ];

  final List<DropdownMenuItem<int>> level = [
    DropdownMenuItem<int>(
      value: 0,
      child: Text(
          'L'),
    ),
    DropdownMenuItem<int>(
      value: 1,
      child: Text(
          'H'),
    ),
    DropdownMenuItem<int>(
      value: 2,
      child: Text(
          'B'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var heightOfWidget = MediaQuery
        .of(context)
        .size
        .height;
    var widthOfWidget = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
        height: heightOfWidget * 0.73,
        width: widthOfWidget * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Airway Identifier:',
                      style: TextStyle(fontSize: extensionTileFontSize),),
                    SizedBox(
                      height: 60,
                    ),
                    Text('Icao Region:',
                      style: TextStyle(fontSize: extensionTileFontSize),),
                    SizedBox(
                      height: 180,
                    ),
                    Text('Type:', style: TextStyle(fontSize: extensionTileFontSize),),
                    SizedBox(
                      height: 60,
                    ),
                    Text('Direction:', style: TextStyle(fontSize: extensionTileFontSize),),
                    SizedBox(
                      height: 60,
                    ),
                    Text('Level:', style: TextStyle(fontSize: extensionTileFontSize),),
                    SizedBox(
                      height: 60,
                    ),
                  ]
              ),
              SizedBox(width: 20,),
              Column(
                children: <Widget>[
                  FilterTextField(
                    width: 200,
                    height: 40,
                    isNumber: false,
                  ),
                  SizedBox(height: 40,),
          SizedBox(
            width: 200,
            height: 160,
            child: new MultiSelect(

              autovalidate: true,
              initialValue: ['IN', 'LT'],
              titleText: 'Icao Code',
              maxLength: 5, // optional
              validator: (dynamic value) {
                if (value == null) {
                  return 'Please select one or more option(s)';
                }
                return null;
              },
              errorText: 'Please select one or more option(s)',
              dataSource: [
                {"name": "Taiwan (RC)", "code": "RC"},
                {"name": "Turkey (LT)", "code": "LT"},
                {"name": "Tuvalu (NF)", "code": "NF"},
                {"name": "Venezuela", "code": "VE"},
                {"name": "Viet Nam", "code": "VN"},
                {"name": "Virgin Islands, British", "code": "VG"},
                {"name": "Virgin Islands, U.S.", "code": "VI"},
                {"name": "Wallis and Futuna", "code": "WF"},
                {"name": "Western Sahara", "code": "EH"},
                {"name": "Yemen", "code": "YE"},
                {"name": "Zambia", "code": "ZM"},
                {"name": "Zimbabwe", "code": "ZW"}
              ],
              textField: 'name',
              valueField: 'code',
              filterable: true,
              required: true,
              onSaved: (value) {
                print('The value is $value');
              },
              selectIcon: Icons.arrow_drop_down_circle,
              saveButtonColor: Theme.of(context).primaryColor,
              checkBoxColor: Theme.of(context).primaryColorDark,
              cancelButtonColor: Theme.of(context).primaryColorLight,
            ),
          ),

                  SizedBox(height: 40,),
                  CustomDropDownMenu(
                    height: 40,
                    width: 200,
                    spinnerItems: typeSpinnerItems,
                  ),
                  SizedBox(height: 40,),
                  CustomDropDownMenu(
                    height: 40,
                    width: 200,
                    spinnerItems: directionSpinnerItems,
                  ),
                  SizedBox(height: 40,),
                  CustomDropDownMenu(
                    height: 40,
                    width: 200,
                    spinnerItems: levelSpinnerItems,
                  ),
                  SizedBox(height: 40,),
                  RaisedButton(
                    child: Text("Search", style: TextStyle(fontSize: 16, color: Colors.white),),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
        ]
      )
        )
  );
/*
            Row(
                  children: <Widget>[
                    Text('Type:', style: TextStyle(fontSize: extensionTileFontSize),),
                    SizedBox(width: 20,),
                    CustomDropDownMenu(
                      height: 40,
                      width: 200,
                      spinnerItems: typeSpinnerItems,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    CustomDropDownMenu(
                      height: 40,
                      width: 200,
                      spinnerItems: directionSpinnerItems,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomDropDownMenu(
                  height: 40,
                  width: 200,
                  spinnerItems: levelSpinnerItems,
                ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: 60,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    child: Text("Search", style: TextStyle(fontSize: 16, color: Colors.white),),
                    onPressed: () => Navigator.pop(context),
                  ),
                )
              ],
            )*/

  }
}