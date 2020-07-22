import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: backgroundColor,
    brightness: Brightness.dark,
    backgroundColor: backgroundColor,
    accentColor: Colors.white,
    textTheme: darkTextTheme,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12);
final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    textTheme: lightTextTheme);

final darkTextTheme = TextTheme(
  title: TextStyle(fontSize: 22.0, fontWeight: FontWeight.normal, color: white),
  headline: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: white),
  body1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: white),
);
final lightTextTheme = TextTheme(
  title: TextStyle(fontSize: 22.0, fontWeight: FontWeight.normal, color: black),
  headline: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: black),
  body1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: black),
);


const TextStyle listTitleDefaultTextStyle = TextStyle(
    color: Colors.white70, fontSize: 13.0, fontWeight: FontWeight.normal);
const TextStyle listTitleSelectedTextStyle =
    TextStyle(color: white, fontSize: 13.0, fontWeight: FontWeight.normal);
const TextStyle defaultWhiteStyle =
    TextStyle(color: white, fontSize: 13.0, fontWeight: FontWeight.normal);
const TextStyle greyStyle =
    TextStyle(color: grey, fontSize: 13.0, fontWeight: FontWeight.normal);
const TextStyle greyBigStyle =
    TextStyle(color: grey, fontSize: 15.0, fontWeight: FontWeight.normal);
const TextStyle defaultWhiteBigStyle = TextStyle(
    color: Colors.white, fontSize:15.0, fontWeight: FontWeight.normal);
const TextStyle defaultWhiteTitleStyle =
    TextStyle(color: white, fontSize: 18.0, fontWeight: FontWeight.normal);
const TextStyle normalTextStyle =
    TextStyle(color: white, fontSize: 15.0, fontWeight: FontWeight.normal);
const TextStyle normalBoldTextStyle = TextStyle(
  color: white,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

//const Color selectedColor = Color(0xFF4AC8EA);
const Color selectedColor = Colors.blueAccent;
//const Color drawerBackgroundColor = Color(0xFF272D34);
Color drawerBackgroundColor = Colors.grey[900];
//const Color wabBackgroundColor = Color(0xFF2979FF);
const Color wabBackgroundColor = Colors.blue;
Color backgroundColor = Colors.grey[900];

const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;
Color customGrey = Color(0xFF9E9E9E);
Color barButtonColor = _colorFromHex("#313C47");
Color visibleBoxBackground = _colorFromHex("#848C95");
var btnColor = Colors.white10;
Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
