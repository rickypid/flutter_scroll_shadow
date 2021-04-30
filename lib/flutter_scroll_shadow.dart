library flutter_scroll_shadow;

import 'package:flutter/material.dart';

class ScrollShadow extends StatefulWidget {
  /// [scrollDirection] is a direction of scroll
  ///
  /// Default: Axis.vertical
  final Axis scrollDirection;

  /// [ScrollController] (Optional) necessary if child scroll used an external controller
  ///
  /// Default: null
  final ScrollController controller;

  /// [color] is a color of shadow
  ///
  /// Default: Colors.grey
  final Color color;

  /// [size] is a size of shadow
  ///
  /// Default: 15
  final double size;

  /// The [child] contained by the ScrollShadow.
  final Widget child;

  /// [animationDuration] is a millisecond of animation duration on shadow visible status change
  ///
  /// Default: 200 milliseconds
  final int animationDuration;

  /// Creates an [ScrollShadow]
  /// Material design's
  ScrollShadow({
    Key key,
    this.child,
    this.size = 15,
    this.color = Colors.grey,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.animationDuration = 200,
  });

  @override
  _ScrollShadowState createState() => _ScrollShadowState();
}

class _ScrollShadowState extends State<ScrollShadow>
    with TickerProviderStateMixin {
  Animation<double> _animationStart;
  Tween<double> _tweenStart;
  AnimationController _animationControllerStart;
  Animation<double> _animationEnd;
  Tween<double> _tweenEnd;
  AnimationController _animationControllerEnd;
  ScrollController _controller;
  bool _reachedStart = true;
  bool _reachedStartSnap = true;
  bool _reachedEnd = false;
  bool _reachedEndSnap = false;

  @override
  void initState() {
    super.initState();
    _animationControllerStart = AnimationController(
        duration: Duration(milliseconds: widget.animationDuration),
        vsync: this);
    _tweenStart = Tween(begin: 0, end: 1);
    _animationStart = _tweenStart.animate(_animationControllerStart)
      ..addListener(() {
        setState(() {});
      });
    _animationControllerStart.reverse(from: 0);
    _animationControllerEnd = AnimationController(
        duration: Duration(milliseconds: widget.animationDuration),
        vsync: this);
    _tweenEnd = Tween(begin: 0, end: 1);
    _animationEnd = _tweenEnd.animate(_animationControllerEnd)
      ..addListener(() {
        setState(() {});
      });
    _animationControllerEnd.forward(from: 1);
  }
  @override
  void dispose() {
    _controller.removeListener(_listener);
    super.dispose();
  }

  void _listener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      _reachedStart = false;
      _reachedEnd = true;
    } else if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      _reachedStart = true;
      _reachedEnd = false;
    } else {
      _reachedStart = false;
      _reachedEnd = false;
    }
    _update();
  }

  void _update() {
    if (_reachedStart != _reachedStartSnap) {
      setState(() {
        if (_reachedStart == false)
          _animationControllerStart.forward(from: 0);
        else
          _animationControllerStart.reverse(from: 1);
      });
    }
    _reachedStartSnap = _reachedStart;
    if (_reachedEnd != _reachedEndSnap) {
      setState(() {
        if (_reachedEnd == false)
          _animationControllerEnd.forward(from: 0);
        else
          _animationControllerEnd.reverse(from: 1);
      });
    }
    _reachedEndSnap = _reachedEnd;
  }
  @override
  Widget build(BuildContext context) {
    if (widget.controller != null) {
      _controller = widget.controller;
      _controller.addListener(_listener);
    } else if (_controller != PrimaryScrollController.of(context)) {
      _controller = PrimaryScrollController.of(context);
      _controller.addListener(_listener);
    }
    _update();
    Widget shadow;
    if (widget.scrollDirection == Axis.horizontal) {
      shadow = Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: _animationStart.value,
              child: Container(
                width: widget.size,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    stops: [0.0, 1.0],
                    colors: [
                      widget.color.withOpacity(0.0),
                      widget.color,
                    ],
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: _animationEnd.value,
              child: Container(
                width: widget.size,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    stops: [0.0, 1.0],
                    colors: [
                      widget.color,
                      widget.color.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      shadow = Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: _animationStart.value,
              child: Container(
                height: widget.size,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.0, 1.0],
                    colors: [
                      widget.color.withOpacity(0.0),
                      widget.color,
                    ],
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: _animationEnd.value,
              child: Container(
                height: widget.size,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    colors: [
                      widget.color.withOpacity(0.0),
                      widget.color,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Stack(
      children: [
        widget.child,
        shadow,
      ],
    );
  }
}
