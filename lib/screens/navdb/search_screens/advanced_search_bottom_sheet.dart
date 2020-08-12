
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/search_screens/sheet_header.dart';
import '../../../widgets/common/custom_dropdownmenu.dart';
import 'filter_text_field.dart';


const double minHeight = 70;

class AdvancedSearchSheet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AdvancedSearchSheetState();
  }
}

class _AdvancedSearchSheetState extends State<AdvancedSearchSheet> with SingleTickerProviderStateMixin{

  AnimationController _controller; //<-- Create a controller

  double get maxHeight => MediaQuery.of(context).size.height;
  double get maxWidth => MediaQuery.of(context).size.width;
  double get headerTopMargin => lerp(20, 20 + MediaQuery.of(context).padding.top); //<-- Add new property
  double get headerFontSize => lerp(14, 24);

  double get containerWidth => lerp(0, maxHeight - 30);
  double get containerHeight => lerp(0, maxWidth - 30);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value); //<-- lerp any value based on the controller

  bool _opened = false;
  List<DropdownMenuItem<int>> spinnerItems = [
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


  @override
  Widget build(BuildContext context) {
    var leftWidth = maxWidth * 0.82;
    return AnimatedBuilder(
      animation: _controller,
        builder: (context, child) {
          var searchScreenHeight = lerp(minHeight, maxHeight * 0.55);
          var searchScreenWidth = lerp(leftWidth, maxWidth * 0.45);
          var topFilterField = headerTopMargin + headerFontSize + 20;
          return Positioned(
            height: searchScreenHeight,
            left: searchScreenWidth,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: _toggle,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                decoration: const BoxDecoration(
                  color: Color(0xFF162A49),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    SheetHeader(
                      fontSize: headerFontSize,
                      topMargin: headerTopMargin,
                    ),

                    AnimatedPositioned(
                        duration: Duration(milliseconds: 600),
                        left: 20,
                        top: topFilterField,
                        child: FilterTextField(
                          height: _opened ? 25 : 0,
                          width: _opened ? 200 : 0,
                          isNumber: false,
                          icon: _opened ? Icon(Icons.search ,color: Colors.black,) : null,
                        )
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 600),
                        left: 240,
                        top: topFilterField,
                        child: CustomDropDownMenu(
                          width: _opened ? 200 : 0,
                          spinnerItems: spinnerItems,
                        )
                    )



                  ],
                ),
              ),
            ),
          );
      }
    );
  }

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2);//<-- ...snap the sheet in proper direction
    setState(() {
      _opened = !_opened;
    });
  }




  Widget _buildSearchMenu(double left, double top, double height, double width){
    return Positioned(
      left: left,
      top: top,
      child: FilterTextField(
        isNumber: false,
        height: lerp(0,height * 0.33),
        width: lerp(0, width * 0.20)
      ),
    );
  }


}



