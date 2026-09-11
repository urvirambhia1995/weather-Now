import 'package:flutter/material.dart';

/// A simple fade‑in animation wrapper.
///
/// The widget fades its [child] in over [duration] after an optional [delay].
/// It can be used to give a subtle entrance effect to cards, list items, etc.
class FadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;

  const FadeIn({
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    super.key,
  });

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
