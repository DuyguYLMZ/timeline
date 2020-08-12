import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablet_app/model/weightandbalancemodel/seats.dart';
import 'package:tablet_app/util/weightandbalanceprovider.dart';
import 'package:tablet_app/widgets/common/picker.dart';
import 'package:tablet_app/values/theme.dart';

import '../numberpicker.dart';

/*void showPickerDialog(BuildContext context, int index) {
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
}*/

void showPickerDialog(BuildContext context, int index) {
  WABProvider provider = Provider.of<WABProvider>(context);
  Picker(
      adapter: NumberPickerAdapter(data: [
        NumberPickerColumn(begin: 0, end: 99),
        NumberPickerColumn(begin: 0, end: 99),
      ]),
      delimiter: [
        PickerDelimiter(
            child: Container(
          width: 10.0,
          alignment: Alignment.center,
          child: Text("."),
        ))
      ],
      hideHeader: true,
      title: Text("Ağırlık"),
      selectedTextStyle: TextStyle(color: wabBackgroundColor),
      onConfirm: (Picker picker, List value) {
        String newWeight = (value[0].toString()+"."+value[1].toString());
        provider.setSeatWeight(index,double.parse(newWeight));
      }).showDialog(context);
}
