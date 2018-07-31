import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

const double _kLinearCustomProgressIndicatorHeight = 15.0;
const int _kIndeterminateLinearDuration = 1800;


abstract class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({
    Key key,
    this.value,
    this.backgroundColor,
    this.valueColor,
  }) : super(key: key);
  final double value;
  final Color backgroundColor;
  final Animation<Color> valueColor;

  Color _getBackgroundColor(BuildContext context) => backgroundColor ?? Theme.of(context).backgroundColor;
  Color _getValueColor(BuildContext context) => valueColor?.value ?? Theme.of(context).accentColor;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(new PercentProperty('value', value, showName: false, ifNull: '<indeterminate>'));
  }
}

class _LinearCustomProgressIndicatorPainter extends CustomPainter {
  // The indeterminate progress animation displays two lines whose leading (head)
  // and trailing (tail) endpoints are defined by the following four curves.
  static const Curve line1Head = const Interval(
    0.0,
    750.0 / _kIndeterminateLinearDuration,
    curve: const Cubic(0.2, 0.0, 0.8, 1.0),
  );
  static const Curve line1Tail = const Interval(
    333.0 / _kIndeterminateLinearDuration,
    (333.0 + 750.0) / _kIndeterminateLinearDuration,
    curve: const Cubic(0.4, 0.0, 1.0, 1.0),
  );
  static const Curve line2Head = const Interval(
    1000.0 / _kIndeterminateLinearDuration,
    (1000.0 + 567.0) / _kIndeterminateLinearDuration,
    curve: const Cubic(0.0, 0.0, 0.65, 1.0),
  );
  static const Curve line2Tail = const Interval(
    1267.0 / _kIndeterminateLinearDuration,
    (1267.0 + 533.0) / _kIndeterminateLinearDuration,
    curve: const Cubic(0.10, 0.0, 0.45, 1.0),
  );

  const _LinearCustomProgressIndicatorPainter({
    this.backgroundColor,
    this.valueColor,
    this.value,
    this.animationValue,
    @required this.textDirection,
  }) : assert(textDirection != null);

  final Color backgroundColor;
  final Color valueColor;
  final double value;
  final double animationValue;
  final TextDirection textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, paint);

    paint.color = valueColor;

    void drawBar(double x, double width) {
      if (width <= 0.0)
        return;

      double left;
      switch (textDirection) {
        case TextDirection.rtl:
          left = size.width - width - x;
          break;
        case TextDirection.ltr:
          left = x;
          break;
      }
      canvas.drawRect(new Offset(left, 0.0) & new Size(width, size.height), paint);
    }

    if (value != null) {
      drawBar(0.0, value.clamp(0.0, 1.0) * size.width);
    } else {
      final double x1 = size.width * line1Tail.transform(animationValue);
      final double width1 = size.width * line1Head.transform(animationValue) - x1;

      final double x2 = size.width * line2Tail.transform(animationValue);
      final double width2 = size.width * line2Head.transform(animationValue) - x2;

      drawBar(x1, width1);
      drawBar(x2, width2);
    }
  }

  @override
  bool shouldRepaint(_LinearCustomProgressIndicatorPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor
        || oldPainter.valueColor != valueColor
        || oldPainter.value != value
        || oldPainter.animationValue != animationValue
        || oldPainter.textDirection != textDirection;
  }
}

class LinearCustomProgressIndicator extends CustomProgressIndicator {

  const LinearCustomProgressIndicator({
    Key key,
    double value,
    Color backgroundColor,
    Animation<Color> valueColor,
  }) : super(key: key, value: value, backgroundColor: backgroundColor, valueColor: valueColor);

  @override
  _LinearCustomProgressIndicatorState createState() => new _LinearCustomProgressIndicatorState();
}

class _LinearCustomProgressIndicatorState extends State<LinearCustomProgressIndicator> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: _kIndeterminateLinearDuration),
      vsync: this,
    );
    if (widget.value == null)
      _controller.repeat();
  }

  @override
  void didUpdateWidget(LinearCustomProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && !_controller.isAnimating)
      _controller.repeat();
    else if (widget.value != null && _controller.isAnimating)
      _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIndicator(BuildContext context, double animationValue, TextDirection textDirection) {
    return new Container(
      constraints: const BoxConstraints.tightFor(
        width: double.infinity,
        height: _kLinearCustomProgressIndicatorHeight,
      ),
      child: new CustomPaint(
        painter: new _LinearCustomProgressIndicatorPainter(
          backgroundColor: widget._getBackgroundColor(context),
          valueColor: widget._getValueColor(context),
          value: widget.value, // may be null
          animationValue: animationValue, // ignored if widget.value is not null
          textDirection: textDirection,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextDirection textDirection = Directionality.of(context);

    if (widget.value != null)
      return _buildIndicator(context, _controller.value, textDirection);

    return new AnimatedBuilder(
      animation: _controller.view,
      builder: (BuildContext context, Widget child) {
        return _buildIndicator(context, _controller.value, textDirection);
      },
    );
  }
}

