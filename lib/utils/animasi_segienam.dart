import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'segienam.dart';

class AnimasiSegiEnam extends StatefulWidget {
  const AnimasiSegiEnam({super.key});

  @override
  State<AnimasiSegiEnam> createState() => _AnimasiSegiEnamState();
}

class _AnimasiSegiEnamState extends State<AnimasiSegiEnam>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => Positioned(
        bottom: 0,
        right: -100,
        child: Transform.rotate(
          angle: _controller.value * pi * 2,
          child: CustomPaint(
            painter: SegiEnam(),
            size: Size(300.h, 300.h),
          ),
        ),
      ),
    );
  }
}
