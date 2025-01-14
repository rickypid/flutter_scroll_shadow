/// [ScrollShadow] class
library;

import 'package:flutter/material.dart';

/// Wraps a scrollable child in `ScrollShadow`s.
class ScrollShadow extends StatefulWidget {
  /// Wraps a scrollable child in `ScrollShadow`s.
  const ScrollShadow({
    super.key,
    this.size = 6.0,
    this.color = Colors.black38,
    required this.child,
    this.duration = const Duration(milliseconds: 250),
    this.fadeInCurve = Curves.easeIn,
    this.fadeOutCurve = Curves.easeOut,
    this.ignoreInteraction = true,
  });

  /// [color] determines rendered color of shadows.
  ///
  /// Default: [Colors.grey]
  final Color color;

  /// [size] is a `double` that represents the size of shadows in logical pixels.
  ///
  /// Default: `6.0`
  final double size;

  /// The scrollable [child] contained by the `ScrollShadow`.
  final Widget child;

  /// The duration for the animation of shadow visibility changes.
  ///
  /// Default: `Duration(milliseconds: 300)`
  final Duration duration;

  /// The animation [Curve] to use for shadow appearance.
  ///
  /// Default: [Curves.easeIn]
  final Curve fadeInCurve;

  /// The animation [Curve] to use for shadow disappearance.
  ///
  /// Default: [Curves.easeOut]
  final Curve fadeOutCurve;

  /// Determines if shadow is wrapped inside a [IgnorePointer] widget, so that
  /// all touch events with the shadow will be ignored.
  ///
  /// Setting this to `true` means that the shadow will be ignored from
  /// interactions, so you can still interact with the widget below.
  ///
  /// Default: `true`
  final bool ignoreInteraction;

  @override
  State<ScrollShadow> createState() => _ScrollShadowState();
}

class _ScrollShadowState extends State<ScrollShadow> {
  bool get reachedStart => _reachedStart;

  set reachedStart(final bool value) {
    if (_reachedStart == value) return;
    setState(() => _reachedStart = value);
  }

  bool get reachedEnd => _reachedEnd;

  set reachedEnd(final bool value) {
    if (_reachedEnd == value) return;
    setState(() => _reachedEnd = value);
  }

  @override
  Widget build(final BuildContext context) {
    LinearGradient? startGradient, endGradient;
    switch (_axis) {
      case null:
        break;
      case Axis.horizontal:
        startGradient = LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [widget.color.withAlpha(0), widget.color],
        );
        endGradient = LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [widget.color, widget.color.withAlpha(0)],
        );
      case Axis.vertical:
        startGradient = LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [widget.color.withAlpha(0), widget.color],
        );
        endGradient = LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [widget.color, widget.color.withAlpha(0)],
        );
    }
    var startShadow = _getShadow(startGradient);
    var endShadow = _getShadow(endGradient);
    if (_animate) {
      startShadow = _getAnimatedShadow(startShadow, reachedStart);
      endShadow = _getAnimatedShadow(endShadow, reachedEnd);
    }
    if (widget.ignoreInteraction) {
      startShadow = _getNoninteractive(startShadow);
      endShadow = _getNoninteractive(endShadow);
    }
    startShadow = _getPositioned(startShadow, true);
    endShadow = _getPositioned(endShadow, false);
    return Stack(
      children: [
        NotificationListener<ScrollMetricsNotification>(
          onNotification: (notification) =>
              _handleNewMetrics(notification.metrics),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) =>
                _handleNewMetrics(notification.metrics),
            child: widget.child,
          ),
        ),
        if (startShadow != null) startShadow,
        if (endShadow != null) endShadow,
      ],
    );
  }

  Widget? _getShadow(final LinearGradient? gradient) => gradient == null
      ? null
      : Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(gradient: gradient),
        );

  Widget? _getAnimatedShadow(final Widget? shadow, final bool reachedEdge) =>
      shadow == null
          ? null
          : AnimatedOpacity(
              opacity: reachedEdge ? 0.0 : 1.0,
              duration: widget.duration,
              curve: reachedEdge ? widget.fadeOutCurve : widget.fadeInCurve,
              child: shadow,
            );

  Widget? _getNoninteractive(final Widget? shadow) => shadow == null
      ? null
      : IgnorePointer(
          ignoring: true,
          child: shadow,
        );

  Widget? _getPositioned(final Widget? shadow, final bool start) {
    if (shadow == null) return null;
    switch (_axis) {
      case null:
        return null;
      case Axis.horizontal:
        return Positioned(
          left: start ? 0.0 : null,
          right: start ? null : 0.0,
          top: 0.0,
          bottom: 0.0,
          child: shadow,
        );
      case Axis.vertical:
        return Positioned(
          top: start ? 0.0 : null,
          bottom: start ? null : 0.0,
          left: 0.0,
          right: 0.0,
          child: shadow,
        );
    }
  }

  bool _handleNewMetrics(final ScrollMetrics metrics) {
    if (_axis != metrics.axis) {
      setState(() => _axis = metrics.axis);
    }
    final isReverse = metrics.axisDirection == AxisDirection.left ||
        metrics.axisDirection == AxisDirection.up;
    reachedStart = isReverse
        ? metrics.pixels >= metrics.maxScrollExtent
        : metrics.pixels <= metrics.minScrollExtent;
    reachedEnd = isReverse
        ? metrics.pixels <= metrics.minScrollExtent
        : metrics.pixels >= metrics.maxScrollExtent;
    _animate = true;
    // Consume the notification to prevent possible ScrollShadow ancestor to interpret them a second timme
    return true;
  }

  Axis? _axis;
  bool _reachedStart = true;
  bool _reachedEnd = true;
  bool _animate = false;
}
