import 'package:tablet_app/model/routepoint_model.dart';

class RoutePoints {
  static List<RoutePoint> _pointList = new List<RoutePoint>();

  List<RoutePoint> getPointList() {
    return _pointList;
  }

  addAllPoint(List<RoutePoint> points) {
    _pointList.addAll(points);
  }

  addPoint(RoutePoint point) {
    _pointList.add(point);
  }

  removePoint(RoutePoint point) {
    _pointList.remove(point);
  }

  removeAllPoint() {
    _pointList.clear();
  }
}
