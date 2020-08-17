import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablet_app/util/palletcargoprovider.dart';
import 'package:tablet_app/util/routemanagementprovider.dart';
import 'package:tablet_app/util/themenotifier.dart';
import 'package:tablet_app/util/weightandbalanceprovider.dart';
import 'package:tablet_app/values/theme.dart';

import 'screens/home_screen.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier(darkTheme),
        ),
        ChangeNotifierProvider<WABProvider>(
          create: (context) => WABProvider(),
        ), ChangeNotifierProvider<PalletCargoProvider>(
          create: (context) => PalletCargoProvider(),
        ),
        ChangeNotifierProvider<RouteProvider>(
          create: (context) => RouteProvider(false),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return  MaterialApp(
      theme:themeNotifier.getTheme() ,
        debugShowMaterialGrid: false,
        title: 'Tablet Demo',
        debugShowCheckedModeBanner: false,
        home: HomePage(title: 'Tablet Demo'),
      );

  }
}
