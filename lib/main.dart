import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablet_app/screens/home_screen.dart';
import 'package:tablet_app/util/themenotifier.dart';
import 'package:tablet_app/values/theme.dart';

void main() => runApp(ChangeNotifierProvider<ThemeNotifier>(
    builder: (_) => ThemeNotifier(darkTheme), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Tablet Demo',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      home: HomePage(title: 'Tablet Demo'),
    );
  }
}
