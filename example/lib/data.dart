import 'package:flutter/material.dart';

class Doodle {
  final String name;
  final Color iconBackground;
  final Icon icon;
  const Doodle(
      {this.name,
      this.icon,
      this.iconBackground});
}

 List<Doodle> doodles = [
  Doodle(
      name: "3x5",
    icon: Icon(Icons.star, color: Colors.white),
      iconBackground: Colors.cyan),
  Doodle(
      name: "3x3",

      icon: Icon(
        Icons.exposure,
        color: Colors.white,
      ),
      iconBackground: Colors.redAccent),
  Doodle(
      name: "3x3",

      icon: Icon(
        Icons.visibility,
        color: Colors.black87,
        size: 32.0,
      ),
      iconBackground: Colors.yellow),
  Doodle(
      name: "3x3",
     icon: Icon(
        Icons.account_balance,
        color: Colors.black87,
      ),
      iconBackground: Colors.amber),

];
