import 'package:flutter/material.dart';

class GradientContent extends StatelessWidget {
  const GradientContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * 0.8,
        decoration: const BoxDecoration(
          backgroundBlendMode: BlendMode.screen,
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
