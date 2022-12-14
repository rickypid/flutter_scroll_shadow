/// [ScrollShadow] class
library flutter_scroll_shadow;

import 'package:flutter/material.dart';

/// Wraps a scrollable child in `ScrollShadow`s.
class ScrollShadow extends StatefulWidget {
  /// Wraps a scrollable child in `ScrollShadow`s.
  ///
  /// [scrollDirection] is the direction of scroll, corresponding to the child.
  ///
  /// [controller] is optional for vertically scrolling content,
  /// but required if [child] scrolls horizontally.
  ScrollShadow({
    Key? key,
    this.size = 15,
    this.color = Colors.grey,
    this.controller,
    this.scrollDirection = Axis.vertical,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOutQuint,
    this.ignoreInteraction = true,
  });

  /// [color] determines rendered color of shadows.
  ///
  /// Default: [Colors.grey]
  final Color color;

  /// [size] is a `double` that represents the size of shadows in logical pixels.
  ///
  /// Default: `15.0`
  final double size;

  /// [scrollDirection] is the direction of scroll, corresponding to the child.
  ///
  /// Default: [Axis.vertical]
  final Axis scrollDirection;

  ///Optional for vertically scrolling content, but required
  /// if [child] scrolls horizontally.
  ///
  /// Default: `null`
  final ScrollController? controller;

  /// The scrollable [child] contained by the `ScrollShadow`.
  ///
  /// Match this `ScrollShadow`'s [scrollDirection] to this `child`'s `scrollDirection`.
  final Widget child;

  /// The duration for the animation of shadow visibility changes.
  ///
  /// Default: `Duration(milliseconds: 300)`
  final Duration duration;

  /// The animation [Curve] to use for shadow visibility changes.
  ///
  /// Default: [Curves.easeIn]
  final Curve curve;

  /// Determines if [ScrollShadow] is wrapped inside a [IgnorePointer] widget,
  /// so that all touch events with the shadow will be ignored.
  /// Setting this `true` means that the shadow will be ignored from interactions,
  /// so you can still interact with the widget below
  ///
  /// Default: `true`
  final bool ignoreInteraction;

  @override
  _ScrollShadowState createState() => _ScrollShadowState();
}

class _ScrollShadowState extends State<ScrollShadow> {
  ScrollController _controller = ScrollController();
  bool _reachedStart = true;
  bool _reachedStartSnap = true;
  bool _reachedEnd = false;
  bool _reachedEndSnap = false;

  @override
  void dispose() {
    _controller.removeListener(_listener);
    super.dispose();
  }

  void _listener() {
    /*if (_controller.position.extentInside != 0)
      print("m:${_controller.position.extentInside}");*/
    _reachedStart = (_controller.position.extentBefore == 0 &&
        _controller.position.hasViewportDimension);
    _reachedEnd = (_controller.position.extentAfter == 0 &&
        _controller.position.hasViewportDimension);
    _update();
  }

  void _update() {
    if (_reachedStart != _reachedStartSnap)
      setState(() => _reachedStartSnap = _reachedStart);
    if (_reachedEnd != _reachedEndSnap)
      setState(() => _reachedEndSnap = _reachedEnd);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller != null) {
      _controller = widget.controller!..addListener(_listener);
    } else if (_controller != PrimaryScrollController.of(context)) {
      _controller = PrimaryScrollController.of(context)!
        ..addListener(_listener);
    }
    _update();

    final Widget shadow = IgnorePointer(
      ignoring: widget.ignoreInteraction,
      child: (widget.scrollDirection == Axis.horizontal)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedOpacity(
                opacity: _reachedStartSnap ? 0 : 1,
                duration: widget.duration,
                curve: widget.curve,
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
              AnimatedOpacity(
                opacity: _reachedEndSnap ? 0 : 1,
                duration: widget.duration,
                curve: widget.curve,
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
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedOpacity(
                opacity: _reachedStartSnap ? 0 : 1,
                duration: widget.duration,
                curve: widget.curve,
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
              AnimatedOpacity(
                opacity: _reachedEndSnap ? 0 : 1,
                duration: widget.duration,
                curve: widget.curve,
                child: Container(
                  height: widget.size,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
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

    return Stack(
      children: <Widget>[widget.child, shadow],
    );
  }
}
