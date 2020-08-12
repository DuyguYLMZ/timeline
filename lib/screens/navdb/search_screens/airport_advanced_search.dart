
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/search_screens/filter_text_field.dart';
import 'package:tablet_app/screens/navdb/widgets/flutter_multiselect.dart';
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
      height: heightOfWidget * 0.5,
      width: widthOfWidget * 0.4,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),

      child:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Airport Name:'),
                SizedBox(
                  height: 60,
                ),
                Text('Airport Identifier:'),
                SizedBox(
                  height: 60,
                ),
                Text('Icao Region:'),
                SizedBox(
                  height: 180,
                ),
              ],
            ),
            SizedBox(width: 40,),
            Column(
              children: <Widget>[
                FilterTextField(
                  width: 200,
                  height: 40,
                  isNumber: false,
                ),
                SizedBox(height: 40,),
                FilterTextField(
                  width: 200,
                  height: 40,
                  isNumber: false,
                ),
                SizedBox(height: 40,),
                SizedBox(
                  width: 200,
                  height: 140,
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
                SizedBox(height: 30,),
                RaisedButton(
                  child: Text("Search", style: TextStyle(fontSize: 16, color: Colors.white),),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      )

      /* Column(
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
      )*/
    );
  }

}