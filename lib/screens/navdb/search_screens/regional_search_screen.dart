
import 'package:flutter/cupertino.dart';

class RegionalSearchScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _RegionalSearchScreenState();
  }

}

class _RegionalSearchScreenState extends State{

  @override
  Widget build(BuildContext context) {

    var heightOfWidget = MediaQuery.of(context).size.height;
    var widthOfWidget  = MediaQuery.of(context).size.width;
    return new Container(
      height: heightOfWidget * 0.5,
      width: widthOfWidget * 0.4,
    );
  }

}