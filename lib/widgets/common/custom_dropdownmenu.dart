import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';

class CustomDropDownMenu extends StatelessWidget {
  final List<DropdownMenuItem> spinnerItems;
  final int dropdownValue;
  final double width;
  final double height;
  final Function onChanged;

  const CustomDropDownMenu(
      {Key key, this.spinnerItems, this.dropdownValue = 0,this.width=60, this.height=25, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: height,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 1 , bottom: 2),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white
                ),
                child: DropdownButton<int>(
                  value: dropdownValue,
                  style: TextStyle(fontSize: 15,color: Colors.black54),
                  items: spinnerItems,
                  onChanged: (item) {
                    onChanged(item);
                  },
                  isExpanded: true,
                  underline: Container(color: Colors.yellow,),
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.black,),
                ),
              ),
            ),
        ),
      ],
    );
  }
}
