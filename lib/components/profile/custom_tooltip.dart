import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart'
;
const Duration _kFadeDuration = const Duration(milliseconds: 200);
const Duration _kShowDuration = const Duration(milliseconds: 1500);

class CustomTooltip extends StatefulWidget {
   const CustomTooltip({
    Key key,
    @required this.message,
    this.height: 32.0,
    this.padding: const EdgeInsets.symmetric(horizontal: 16.0),
    this.verticalOffset: 24.0,
    this.preferBelow: true,
    this.excludeFromSemantics: false,
    this.child,
  }) : assert(message != null),
        assert(height != null),
        assert(padding != null),
        assert(verticalOffset != null),
        assert(preferBelow != null),
        assert(excludeFromSemantics != null),
        super(key: key);

  final String message;
  final double height;

  final EdgeInsetsGeometry padding;
  final double verticalOffset;

  final bool preferBelow;
  final bool excludeFromSemantics;
  final Widget child;

  @override
  _TooltipState createState() => new _TooltipState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(new StringProperty('message', message, showName: false));
    properties.add(new DoubleProperty('vertical offset', verticalOffset));
    properties.add(new FlagProperty('position', value: preferBelow, ifTrue: 'below', ifFalse: 'above', showName: true));
  }
}

class _TooltipState extends State<CustomTooltip> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  OverlayEntry _entry;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(duration: _kFadeDuration, vsync: this)
      ..addStatusListener(_handleStatusChanged);
  }

  void _handleStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.dismissed)
      _removeEntry();
  }
  bool ensureTooltipVisible() {
    if (_entry != null) {
      _timer?.cancel();
      _timer = null;
      _controller.forward();
      return false; // Already visible.
    }
    final RenderBox box = context.findRenderObject();
    final Offset target = box.localToGlobal(box.size.center(Offset.zero));
    final Widget overlay = new _TooltipOverlay(
        message: widget.message,
        height: widget.height,
        padding: widget.padding,
        animation: new CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn
        ),
        target: target,
        verticalOffset: widget.verticalOffset,
        preferBelow: widget.preferBelow
    );
    _entry = new OverlayEntry(builder: (BuildContext context) => overlay);
    Overlay.of(context, debugRequiredFor: widget).insert(_entry);
    GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointerEvent);
    SemanticsService.tooltip(widget.message);
    _controller.forward();
    return true;
  }

  void _removeEntry() {
    assert(_entry != null);
    _timer?.cancel();
    _timer = null;
    _entry.remove();
    _entry = null;
    GestureBinding.instance.pointerRouter.removeGlobalRoute(_handlePointerEvent);
  }

  void _handlePointerEvent(PointerEvent event) {
    assert(_entry != null);
    if (event is PointerUpEvent || event is PointerCancelEvent)
      _timer ??= new Timer(_kShowDuration, _controller.reverse);
    else if (event is PointerDownEvent)
      _controller.reverse();
  }

  @override
  void deactivate() {
    if (_entry != null)
      _controller.reverse();
    super.deactivate();
  }

  @override
  void dispose() {
    if (_entry != null)
      _removeEntry();
    _controller.dispose();
    super.dispose();
  }

  void _handleLongPress() {
    final bool tooltipCreated = ensureTooltipVisible();
    if (tooltipCreated)
      Feedback.forLongPress(context);
  }

  @override
  Widget build(BuildContext context) {
    assert(Overlay.of(context, debugRequiredFor: widget) != null);
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _handleLongPress,
      excludeFromSemantics: true,
      child: new Semantics(
        label: widget.excludeFromSemantics ? null : widget.message,
        child: widget.child,
      ),
    );
  }
}
class _TooltipPositionDelegate extends SingleChildLayoutDelegate {
  _TooltipPositionDelegate({
    @required this.target,
    @required this.verticalOffset,
    @required this.preferBelow,
  }) : assert(target != null),
        assert(verticalOffset != null),
        assert(preferBelow != null);
  final Offset target;
  final double verticalOffset;
  final bool preferBelow;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) => constraints.loosen();

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return positionDependentBox(
      size: size,
      childSize: childSize,
      target: target,
      verticalOffset: verticalOffset,
      preferBelow: preferBelow,
    );
  }

  @override
  bool shouldRelayout(_TooltipPositionDelegate oldDelegate) {
    return target != oldDelegate.target
        || verticalOffset != oldDelegate.verticalOffset
        || preferBelow != oldDelegate.preferBelow;
  }
}

class _TooltipOverlay extends StatelessWidget {
  const _TooltipOverlay({
    Key key,
    this.message,
    this.height,
    this.padding,
    this.animation,
    this.target,
    this.verticalOffset,
    this.preferBelow,
  }) : super(key: key);

  final String message;
  final double height;
  final EdgeInsetsGeometry padding;
  final Animation<double> animation;
  final Offset target;
  final double verticalOffset;
  final bool preferBelow;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeData darkTheme = new ThemeData(
      brightness: Brightness.dark,
      textTheme: theme.brightness == Brightness.dark ? theme.textTheme : theme.primaryTextTheme,
      platform: theme.platform,
    );
    return new Positioned.fill(
      child: new IgnorePointer(
        child: new CustomSingleChildLayout(
          delegate: new _TooltipPositionDelegate(
            target: target,
            verticalOffset: verticalOffset,
            preferBelow: preferBelow,
          ),
          child: new FadeTransition(
            opacity: animation,
            child: new Opacity(
              opacity: 0.9,
              child: new ConstrainedBox(
                constraints: new BoxConstraints(minHeight: height),
                child: new Container(
                  decoration: new BoxDecoration(
                    color: darkTheme.backgroundColor,
                    borderRadius: new BorderRadius.circular(2.0),
                  ),
                  padding: padding,
                  child: new Center(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: new Text(message, style: darkTheme.textTheme.body1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
