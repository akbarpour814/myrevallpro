import 'package:flutter/material.dart';

class AnimatedExpandedWidget extends StatefulWidget {
  final Widget child;
  final bool expand;
  final Axis axis;
  const AnimatedExpandedWidget(
      {super.key,
      this.expand = false,
      this.axis = Axis.vertical,
      required this.child});

  @override
  _AnimatedExpandedWidgetState createState() => _AnimatedExpandedWidgetState();
}

class _AnimatedExpandedWidgetState extends State<AnimatedExpandedWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? expandController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController!,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController!.forward();
    } else {
      expandController!.reverse();
    }
  }

  @override
  void didUpdateWidget(AnimatedExpandedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axis: widget.axis,
        axisAlignment: 1.0,
        sizeFactor: animation!,
        child: widget.child);
  }
}
