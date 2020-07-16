import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

final drawerItems = [
  new DrawerItem('Choose NavDB Source', Icons.select_all),
  new DrawerItem('Airport',   Icons.local_airport),
  new DrawerItem('Airport Communication', Icons.call),
  new DrawerItem('Runway', Icons.linear_scale),
  new DrawerItem('Airway', Icons.linear_scale),
  new DrawerItem('Navaid', Icons.navigation),
  new DrawerItem('Fir/Uir', Icons.linear_scale),
  new DrawerItem('Cas', Icons.polymer),
  new DrawerItem('Ras/Saa', Icons.remove_circle),
];