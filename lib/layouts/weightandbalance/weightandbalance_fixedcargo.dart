import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';

class FixedCargo extends StatefulWidget {
  @override
  _FixedCargo createState() => _FixedCargo();
}

class _ListItem {
  _ListItem(this.value, this.checked);

  final String value;
  bool checked;
}

class _FixedCargo extends State<FixedCargo> {
  static final _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
  ].map((item) => _ListItem(item, false)).toList();

  @override
  Widget build(BuildContext context) {
    final _listTiles = _items
        .map(
          (item) =>
          CheckboxListTile(
            key: Key(item.value),
            checkColor: white,
            activeColor: wabBackgroundColor,
            value: item.checked ?? false,
            onChanged: (bool newValue) {
              setState(() => item.checked = newValue);
            },
            title: Text('Palet ${item.value}'),
            isThreeLine: true,
            subtitle: Text('Item ${item.value}, ekli =${item.checked}'),
          ),
    )
        .toList();
    return ListView(
      children: _listTiles,
    );
  }


}
