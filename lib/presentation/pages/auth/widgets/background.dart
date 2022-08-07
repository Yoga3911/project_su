import 'package:flutter/material.dart';

class BackgroundContent extends StatelessWidget {
  const BackgroundContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg5.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
