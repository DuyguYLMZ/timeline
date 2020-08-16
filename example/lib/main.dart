import 'package:example/Provider.dart';
import 'package:flutter/material.dart';
import 'timeline.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => DataProvider(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Timeline Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TimelinePage(),
      ),
    );
  }
}
