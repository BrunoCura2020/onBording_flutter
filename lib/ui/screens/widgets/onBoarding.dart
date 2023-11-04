import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  final Color color;
  final texto;
  final Widget? child;

  const OnBoarding({super.key, required this.color, required this.texto, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: child,
        ),
        const SizedBox( height: 30.0),
        if(texto != null)
        Text(texto, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      ],
    );
  }
}
