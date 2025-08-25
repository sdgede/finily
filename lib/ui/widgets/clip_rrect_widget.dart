import 'package:flutter/material.dart';

class ClipRRectWidget extends StatelessWidget {
  const ClipRRectWidget({
    super.key,
    required this.leftRadius,
    required this.topRadius,
    required this.rightRadius,
    required this.bottomRadius,
    this.width,
    this.height,
    this.maxWidth,
    this.maxHeight,
    this.color,
    this.child,
  });

  final double leftRadius;
  final double topRadius;
  final double rightRadius;
  final double bottomRadius;

  final double? width;
  final double? height;
  final double? maxWidth;
  final double? maxHeight;
  final Color? color;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topRadius),
        topRight: Radius.circular(rightRadius),
        bottomRight: Radius.circular(bottomRadius),
        bottomLeft: Radius.circular(leftRadius),
      ),
      child: Container(
        width: width,
        height: height,
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? double.infinity,
          maxHeight: maxHeight ?? double.infinity,
        ),
        color: color ?? Colors.purple,
        child: child,
      ),
    );
  }
}
