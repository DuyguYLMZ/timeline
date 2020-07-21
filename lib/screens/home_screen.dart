import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/appbar.dart';
import 'package:tablet_app/widgets/common/mainmenu_drawer.dart';
import 'package:tablet_app/widgets/homefloatingactionbutton.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Marker> markerList = List<Marker>();
  double xx = 20;
  double yy = 50;
  bool isFirst = false;
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: AppBarWidget(
        scaffoldKey: _scaffoldKey,
        title: widget.title == null ? "" : widget.title,
        isHome: true,
        onMenuItemSelected: (int value){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      child: new Container(),
                    )
                );
              });
        },
      ),
      drawer: MainMenuDrawer(context, _scaffoldKey),
      body: Stack(
        children: <Widget>[
          new FlutterMap(
              options: new MapOptions(
                  onTap: (LatLng location) {
                    if (!isFinished) {
                      setState(() {
                        isFirst = true;
                        xx = location.latitude;
                        yy = location.longitude;
                      });
                    }
                  },
                  zoom: 7,
                  minZoom: 1.0,
                  center: new LatLng(39.92, 32.85)),
              layers: [
                new TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
                new MarkerLayerOptions(markers: addMarker())
              ])
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 115),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            isFirst ? FloatingActionButton(
              child: isFinished ? Icon(Icons.edit) : Icon(Icons.close),
              splashColor: btnColor,
              onPressed: () {
                if (isFinished) {
                  isFinished = false;
                } else {
                  isFinished = true;
                }
                (context as Element).markNeedsBuild();
              },
            ):Container(),
            Flexible(child: HomeFloatingActionButton()),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  addMarker() {
    markerList.add(Marker(
        width: 90.0,
        height: 90.0,
        point: new LatLng(xx, yy),
        builder: (context) => new Container(
              child: IconButton(
                  color: black,
                  icon: Icon(Icons.flag),
                  onPressed: () {
                    _showDialog(context);
                  }),
            )));
    return markerList;
  }
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 2,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: drawerBackgroundColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 50,
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 5.0,
                                      offset: Offset(0.0, 0.75))
                                ],
                                color: backgroundColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Orası Burası",
                                  style: defaultWhiteTitleStyle,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Tamam",
                                style: defaultWhiteBigStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        // These values are based on trial & error method
                        alignment: Alignment(1.05, -1.05),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.close,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
