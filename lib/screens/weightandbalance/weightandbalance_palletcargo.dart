import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';

class PalletCargo extends StatefulWidget {
  @override
  _PalletCargo createState() => _PalletCargo();
}

class _ListItem {
  _ListItem(this.value, this.checked);

  final String value;
  bool checked;
}

class _PalletCargo extends State<PalletCargo> {
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
            value: item.checked ?? false,
            onChanged: (bool newValue) {
              setState(() => item.checked = newValue);
            },
            title: Text('Palet ${item.value}'),
            isThreeLine: true,
            subtitle: Text('Item ${item.value}, ekli =${item.checked}'),
            secondary: Icon(Icons.drag_handle),
          ),
    )
        .toList();
    return ListView(

      children: _listTiles,
    );
  }


}
