import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/utils/bintang.dart';

class AnimasiBintang extends StatefulWidget {
  const AnimasiBintang({super.key});

  @override
  State<AnimasiBintang> createState() => _AnimasiBintang();
}

class _AnimasiBintang extends State<AnimasiBintang>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
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
        bottom: 100.h,
        left: 50.w,
        child: Transform.rotate(
          angle: -(_controller.value * pi * 2),
          child: CustomPaint(
            painter: Bintang(),
            size: Size(100.h, 100.h),
          ),
        ),
      ),
    );
  }
}
