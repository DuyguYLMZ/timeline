import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

typedef DisplayChange = void Function(bool is_open);

class FabCircularMenu extends StatefulWidget {
  final List<Widget> children;
  final Alignment alignment;
  final Color ringColor;
  final double ringDiameter;
  final double ringWidth;
  final double fabSize;
  final double fabElevation;
  final Color fabColor;
  final Color fab_openColor;
  final Color fabCloseColor;
  final Icon fab_openIcon;
  final Icon fabCloseIcon;
  final EdgeInsets fabMargin;
  final Duration animationDuration;
  final Curve animationCurve;
  final DisplayChange onDisplayChange;

  FabCircularMenu(
      {Key key,
      this.alignment = Alignment.bottomRight,
      this.ringColor,
      this.ringDiameter,
      this.ringWidth,
      this.fabSize = 64.0,
      this.fabElevation = 8.0,
      this.fabColor,
      this.fab_openColor,
      this.fabCloseColor,
      this.fab_openIcon = const Icon(Icons.layers),
      this.fabCloseIcon = const Icon(Icons.close),
      this.fabMargin = const EdgeInsets.all(16.0),
      this.animationDuration = const Duration(milliseconds: 800),
      this.animationCurve = Curves.easeInOutCirc,
      this.onDisplayChange,
      @required this.children})
      : assert(alignment != Alignment.center),
        assert(children != null),
        super(key: key);

  @override
  FabCircularMenuState createState() => FabCircularMenuState();
}

class FabCircularMenuState extends State<FabCircularMenu>
    with SingleTickerProviderStateMixin {
  double _screenWidth;
  double _screenHeight;
  double _marginH;
  double _marginV;
  double _directionX;
  double _directionY;
  double _translationX;
  double _translationY;

  Color _ringColor;
  double _ringDiameter;
  double _ringWidth;
  Color _fabColor;
  Color _fab_openColor;
  Color _fabCloseColor;

  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  Animation _scaleCurve;
  Animation<double> _rotateAnimation;
  Animation _rotateCurve;
  Animation<Color> _colorAnimation;
  Animation _colorCurve;

  bool _is_open = false;
  bool _is_animating = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: widget.animationDuration, vsync: this);

    _scaleCurve = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.4, curve: widget.animationCurve));
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_scaleCurve)
      ..addListener(() {
        setState(() {});
      });

    _rotateCurve = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 1.0, curve: widget.animationCurve));
    _rotateAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(_rotateCurve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _calculateProps();
  }

  @override
  Widget build(BuildContext context) {
    // This makes the widget able to correctly redraw on
    // hot reload while keeping performance in production
    if (!kReleaseMode) {
      _calculateProps();
    }

    return Container(
      margin: widget.fabMargin,
      alignment: Alignment.bottomRight,
      transform: Matrix4.translationValues(16.0, 16.0, 0.0),
      child: Stack(
        alignment: widget.alignment,
        children: <Widget>[
          Transform(
            transform:
                Matrix4.translationValues(_translationX, _translationY, 0.0)
                  ..scale(_scaleAnimation.value),
            alignment: FractionalOffset.center,
            child: OverflowBox(
              maxWidth: _ringDiameter,
              maxHeight: _ringDiameter,
              child: Container(
                width: _ringDiameter,
                height: _ringDiameter,
                child: CustomPaint(
                  painter: _RingPainter(width: _ringWidth, color: _ringColor),
                  child: _scaleAnimation.value == 1.0
                      ? Transform.rotate(
                          angle: (2 * pi) *
                              _rotateAnimation.value *
                              _directionX *
                              _directionY,
                          child: Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: _applyTranslations(widget.children),
                            ),
                          ),
                        )
                      : Container(),
                ),
              ),
            ),
          ),
          Container(
            width: widget.fabSize,
            height: widget.fabSize,
            child: RawMaterialButton(
              fillColor: _colorAnimation.value,
              shape: CircleBorder(),
              elevation: widget.fabElevation,
              onPressed: () {
                if (_is_animating) return;

                if (_is_open) {
                  close();
                } else {
                  _open();
                }
              },
              child: Center(
                  child: _scaleAnimation.value == 1.0
                      ? widget.fabCloseIcon
                      : widget.fab_openIcon),
            ),
          ),
        ],
      ),
    );
  }

  void _calculateProps() {
    _ringColor = widget.ringColor ?? Theme.of(context).primaryColor;
    _fabColor = widget.fabColor ?? Theme.of(context).primaryColor;
    _fab_openColor = widget.fab_openColor ?? _fabColor;
    _fabCloseColor = widget.fabCloseColor ?? _fabColor;
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _ringDiameter =
        widget.ringDiameter ?? min(_screenWidth, _screenHeight) * 1.25;
    _ringWidth = widget.ringWidth ?? _ringDiameter * 0.3;
    _marginH = (widget.fabMargin.right + widget.fabMargin.left) / 2;
    _marginV = (widget.fabMargin.top + widget.fabMargin.bottom) / 2;
    _directionX = widget.alignment.x == 0 ? 1 : widget.alignment.x;
    _directionY = widget.alignment.y == 0 ? 1 : widget.alignment.y;
    _translationX =
        ((_screenWidth - widget.fabSize) / 2 - _marginH) * widget.alignment.x;
    _translationY =
        ((_screenHeight - widget.fabSize) / 2 - _marginV) * widget.alignment.y;

    if (_colorAnimation == null || !kReleaseMode) {
      _colorCurve = CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.0, 0.4, curve: widget.animationCurve));
      _colorAnimation = ColorTween(begin: _fabCloseColor, end: _fab_openColor)
          .animate(_colorCurve)
            ..addListener(() {
              setState(() {});
            });
    }
  }

  void _open() {
    _is_animating = true;
    _animationController.forward().then((_) {
      _is_animating = false;
      _is_open = true;
      if (widget.onDisplayChange != null) {
        widget.onDisplayChange(true);
      }
    });
  }

  void close() {
    _is_animating = true;
    _animationController.reverse().then((_) {
      _is_animating = false;
      _is_open = false;
      if (widget.onDisplayChange != null) {
        widget.onDisplayChange(false);
      }
    });
  }

  bool get is_open => _is_open;

  List<Widget> _applyTranslations(List<Widget> widgets) {
    double angleFix = 0.0;
    if (widget.alignment.x == 0) {
      angleFix = 45.0 * _directionY.abs();
    } else if (widget.alignment.y == 0) {
      angleFix = -45.0 * _directionX.abs();
    }

    return widgets
        .asMap()
        .map((index, widget) {
          final double angle = (90.0 / (widgets.length - 1) * index+ (angleFix));
          return MapEntry(index, _applyTranslation(angle, widget));
        })
        .values
        .toList();
  }

  Widget _applyTranslation(double angle, Widget widget) {
    final double rad = vector.radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate((-(_ringDiameter / 2) * math.cos(rad)+ (_ringWidth/2 * math.cos(rad)))* _directionX,
           (-(_ringDiameter / 2) * math.sin(rad)+(_ringWidth/2 * math.sin(rad)))*_directionY),
      child: widget,
    );
  }
}

class _RingPainter extends CustomPainter {
  final double width;
  final Color color;

  _RingPainter({@required this.width, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width < width ? size.width : width;

    canvas.drawArc(
        Rect.fromLTWH(
            width / 2, width / 2, size.width - width, size.height - width),
        0.0,
        2 * pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
