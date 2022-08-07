import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/utils/segitiga.dart';

class AnimasiSegiTiga extends StatefulWidget {
  const AnimasiSegiTiga({super.key});

  @override
  State<AnimasiSegiTiga> createState() => _AnimasiSegiTiga();
}

class _AnimasiSegiTiga extends State<AnimasiSegiTiga>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
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
        top: 25.h,
        left: 0,
        child: Transform.rotate(
          angle: _controller.value * pi * 2,
          child: CustomPaint(
            painter: SegiTiga(),
            size: Size(150.h, 150.h),
          ),
        ),
      ),
    );
  }
}

class AnimasiSegiTiga2 extends StatefulWidget {
  const AnimasiSegiTiga2({super.key});

  @override
  State<AnimasiSegiTiga2> createState() => _AnimasiSegiTiga2();
}

class _AnimasiSegiTiga2 extends State<AnimasiSegiTiga2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
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
        top: 5.h,
        right: 75.w,
        child: Transform.rotate(
          angle: _controller.value * pi * 2,
          child: CustomPaint(
            painter: SegiTiga(),
            size: Size(100.h, 100.h),
          ),
        ),
      ),
    );
  }
}
