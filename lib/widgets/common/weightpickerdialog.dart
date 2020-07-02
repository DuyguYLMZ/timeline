
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';

import '../numberpicker.dart';

void showPickerDialog(BuildContext context, int index) {
  showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.decimal(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            border: Border.all(
              color: drawerBackgroundColor,
              width: 1,
            ),
          ),
          minValue: 0,
          maxValue: 90,
          confirmWidget: Text(
            "Tamam",
          ),
          cancelWidget: Text(
            "İptal",
          ),
          highlightSelectedValue: true,
          title: new Text("Ağırlık"),
          initialDoubleValue: 0,
        );
      }).then((double value) {
  });
}