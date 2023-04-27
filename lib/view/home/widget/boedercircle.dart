import 'package:chefskart/helpers/ksizedbox.dart';
import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    required this.child,
    required this.width,
    required this.color,
    this.boxShadow,
  });
  final Widget child;
  final double width;
  final Color color;

  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          shape: BoxShape.circle,
          border: Border.all(color: color, width: width),
        ),
        child: child);
  }
}
