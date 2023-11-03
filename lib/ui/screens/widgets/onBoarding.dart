import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  final Color color;
  final Text? texto;
  final Widget? child;

  const OnBoarding({super.key, required this.color, required this.texto, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: child,

    );
  }
}
