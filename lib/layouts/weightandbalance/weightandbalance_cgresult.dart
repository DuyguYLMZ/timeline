import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poly/poly.dart';
import 'package:tablet_app/model/weightandbalancemodel/cgModel.dart';
import 'package:tablet_app/values/theme.dart';

class WABCGResults extends StatefulWidget {
  GlobalKey scaffoldKey;

  WABCGResults(this.scaffoldKey);

  @override
  _WABCGResultsState createState() {
    return _WABCGResultsState();
  }
}

class _WABCGResultsState extends State<WABCGResults> {
  double takeOffWeight = 2743.5;
  double landingWeight = 2541.8;
  double initialFuelWeight = 92;
  double remainingFuelWeight = 56.5;
  bool loadedWithinEnvelope = true;
  String acName = 'N5000J';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    CGModel model = CGModel(
        valueName: "Zero",
        valueWeight: 12,
        valueWeightUnit: "kg",
        valueFWDown: 15,
        valueFWUp: 16);

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return _buildVerticalLayout(model);
    } else {
      return _buildHorizontalLayout(model);
    }
  }

  Widget _buildVerticalLayout(CGModel model) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: drawerBackgroundColor,
        ),
        child: Scrollbar(
          child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10, 10),
                    child:  Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                            MediaQuery.of(context).size.height / 2,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  color: Color(0xff696969),
                                  height: 20,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        ' SUMMARY',
                                        style: defaultWhiteBigStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    margin:
                                    const EdgeInsets.only(left: 20.0),
                                    color: drawerBackgroundColor,
                                    child: buildRow()),
                                Divider(color: grey, height: 20.0),
                                Container(
                                    margin:
                                    const EdgeInsets.only(left: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Takeoff Weight',
                                          style: defaultWhiteStyle,
                                        ),
                                        Text(
                                          '$takeOffWeight LB',
                                          style: defaultWhiteStyle,
                                        ),
                                      ],
                                    )),
                                Divider(color: grey, height: 20.0),
                                Container(
                                    margin:
                                    const EdgeInsets.only(left: 20.0),
                                    color: drawerBackgroundColor,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Landing Weight',
                                          style: defaultWhiteStyle,
                                        ),
                                        Text(
                                          '$landingWeight LB',
                                          style: defaultWhiteStyle,
                                        ),
                                      ],
                                    )),
                                Divider(color: grey, height: 20.0),
                                Container(
                                    margin:
                                    const EdgeInsets.only(left: 20.0),
                                    color: drawerBackgroundColor,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Fuel Load',
                                          style: defaultWhiteStyle,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                "$initialFuelWeight GAL ",
                                                style: defaultWhiteStyle,
                                              ),
                                              WidgetSpan(
                                                child: Icon(
                                                    Icons.arrow_forward,
                                                    size: 20,
                                                    color: Colors.indigo),
                                              ),
                                              TextSpan(
                                                text: "56.5GAL ",
                                                style: defaultWhiteStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                  color: Color(0xff696969),
                                  height: 43,
                                  child: Row(
                                    children: <Widget>[
                                      Text('  CHART',
                                          style: defaultWhiteStyle),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                            MediaQuery.of(context).size.height / 2,
                            color: drawerBackgroundColor,
                            child: CustomPaint(
                              painter: CurvePainter(),
                            ),
                          )
                        ],
                      ),
                    ),)
              ]),
        ));
  }

  Widget _buildHorizontalLayout(CGModel model) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: drawerBackgroundColor,
        ),
        child: Scrollbar(
          child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10, 10),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                    MediaQuery.of(context).size.height /
                                        2,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          color: Color(0xff696969),
                                          height: 15,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                ' SUMMARY',
                                                style: defaultWhiteStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 20.0),
                                            color: drawerBackgroundColor,
                                            child: buildRow()),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Takeoff Weight',
                                                  style: defaultWhiteStyle,
                                                ),
                                                Text(
                                                  '$takeOffWeight LB',
                                                  style: defaultWhiteStyle,
                                                ),
                                              ],
                                            )),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 20.0),
                                            color: drawerBackgroundColor,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Landing Weight',
                                                  style: defaultWhiteStyle,
                                                ),
                                                Text(
                                                  '$landingWeight LB',
                                                  style: defaultWhiteStyle,
                                                ),
                                              ],
                                            )),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 20.0),
                                            color: drawerBackgroundColor,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Fuel Load',
                                                  style: defaultWhiteStyle,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                        "$initialFuelWeight GAL ",
                                                        style:
                                                        defaultWhiteStyle,
                                                      ),
                                                      WidgetSpan(
                                                        child: Icon(
                                                            Icons
                                                                .arrow_forward,
                                                            size: 30,
                                                            color: Colors
                                                                .indigo),
                                                      ),
                                                      TextSpan(
                                                        text: "56.5GAL ",
                                                        style:
                                                        defaultWhiteStyle,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Container(
                                          color: Color(0xff696969),
                                          height: 43,
                                          child: Row(
                                            children: <Widget>[
                                              Text('  CHART',
                                                  style: defaultWhiteStyle),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                    MediaQuery.of(context).size.height /
                                        2,
                                    color: drawerBackgroundColor,
                                    child: CustomPaint(
                                      painter: CurvePainter(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ]),
        ));
  }

  Row buildRow() {
    CurvePainter cv = new CurvePainter();
    if (cv.loadedWithinEnvelope != null && cv.loadedWithinEnvelope) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$acName - Loaded Within Envelope',
            style: defaultWhiteStyle,
          ),
          Icon(Icons.check_circle, size: 20, color: Colors.greenAccent),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$acName - Not Loaded Within Envelope',
            style: defaultWhiteStyle,
          ),
          Icon(Icons.cancel, size: 20, color: Colors.red),
        ],
      );
    }
  }
}

class CurvePainter extends CustomPainter {
  Point ratio;
  Point originPoint;
  Point endPoint;
  double interval;
  double differenceX;
  double differenceY;
  bool loadedWithinEnvelope;

  @override
  void paint(Canvas canvas, Size size) {
    interval = size.width * 5 / 100;
    originPoint = new Point(interval, size.height - interval);
    endPoint = new Point(size.width - interval, interval);
    Size graphSize =
        new Size(size.width - 2 * interval, size.height - 2 * interval);

    //Canvas canvas, String text, Color color, double offsetX, double offsetY

    _calculatePixelRatio(
        graphSize, 15.789473684210526315789473684211, 7600, 29.45, 16150.0);

    Paint paint = getCustomPaint(Colors.white10, 2.0);
    Paint paintEnvelop = getCustomPaint(Colors.white70, 4.0);
    var colorList = [
      Colors.lightBlue,
      Colors.purpleAccent,
      Colors.orangeAccent
    ];

    var path = Path();
    var axisPoints = new List<Point>();

    for (double i = 0; i < size.width; i += interval) {
      path.moveTo(i, 0);
      path.lineTo(i, size.height);
      for (double j = 0; j < size.height; j += interval) {
        axisPoints.add(new Point(i, j));
        path.moveTo(0, j);
        path.lineTo(size.width, j);
      }
    }
    var weightTextList = ['Takeoff', 'Landing', 'Zero Fuel'];
    double space = axisPoints.elementAt(1).x + interval / 2;
    for (int i = 1; i <= 3; i++) {
      canvas.drawCircle(
          new Offset(space, axisPoints.elementAt(0).y + interval / 2),
          5.0,
          getCustomPaint(colorList.elementAt((i - 1) % 3), interval / 2));
      drawText(canvas, weightTextList.elementAt(i - 1), white,
          space + interval / 2, axisPoints.elementAt(0).y + interval / 4);
      space += 4 * interval;
    }
    drawText(canvas, 'WEIGHT', white, 10.0, size.height / 2);
    drawText(canvas, 'CG', white, size.width / 2, size.height - 45.5);

    var pointList = new List<Point>();
    Point point1 = convertToPixel(new Point(15.80, 7600)); //(50.0,50.0);
    Point point2 = convertToPixel(new Point(15.80, 16000)); //(50.0,100.0);
    Point point3 = convertToPixel(new Point(29.30, 21000)); //(200.0,300.0);
    Point point4 = convertToPixel(new Point(29.30, 7600)); //(200.0,50.0);
    pointList.add(point1);
    pointList.add(point2);
    pointList.add(point3);
    pointList.add(point4);

    Point takeoffWeight = convertToPixel(new Point(17.5, 10200));
    Point landingWeight = convertToPixel(new Point(15.5, 8200));
    Point zerofuelWeight = convertToPixel(new Point(14.5, 7600));
    var weightPointList = new List<Point>();
    weightPointList.add(takeoffWeight);
    weightPointList.add(landingWeight);
    weightPointList.add(zerofuelWeight);

    Polygon envelopPoly = new Polygon(pointList);
    for (Point point in weightPointList) {
      if (envelopPoly.isPointInside(point) == false) {
        loadedWithinEnvelope = false;
      }
    }

    var envelop = new Path();

    for (int i = 0; i < pointList.length; i++) {
      if (i + 1 < pointList.length) {
        envelop.moveTo(pointList.elementAt(i).x, pointList.elementAt(i).y);
        envelop.lineTo(
            pointList.elementAt(i + 1).x, pointList.elementAt(i + 1).y);
      } else {
        envelop.moveTo(pointList.elementAt(i).x, pointList.elementAt(i).y);
        envelop.lineTo(pointList.elementAt(0).x, pointList.elementAt(0).y);
      }
    }

    var offsetList = new List<Offset>();

    for (Point point in weightPointList) {
      offsetList.add(new Offset(point.x, point.y));
    }
    path.addPolygon(offsetList, true);

    canvas.drawPath(path, paint);
    canvas.drawPath(envelop, paintEnvelop);
//    canvas.drawPoints(PointMode.points, offsetList, getCustomPaint(colorList.elementAt(1), 4.0));

    for (int i = 0; i < offsetList.length; i++) {
      canvas.drawCircle(offsetList.elementAt(i), 5.0,
          getCustomPaint(colorList.elementAt(i % 3), 14.0));
    }
  }

  Paint getCustomPaint(Color color, double width) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = width;
    return paint;
  }

  void drawText(
      Canvas canvas, String text, Color color, double offsetX, double offsetY) {
    TextSpan span = new TextSpan(style: defaultWhiteBigStyle, text: text);
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, new Offset(offsetX, offsetY));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  Point convertToPixel(Point point) {
    double ratioX = ratio.x;
    double ratioY = ratio.y;
    return new Point(
        point.x * ratioX - differenceX, point.y * ratioY - differenceY);
  }

  _calculatePixelRatio(Size size, double minX, double minY, double maxX, maxY) {
    ratio = new Point(size.width / (maxX - minX).abs() / 2,
        size.height / (maxY - minY).abs() / 2);
    differenceX = minX * ratio.x - originPoint.x - interval * 4;
    differenceY = minY * ratio.y - originPoint.y + interval * 5;
  }
}
