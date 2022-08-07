import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String label;
  final TextStyle? textStyle;
  final String destination;
  final String tag;
  const CustomButton({
    super.key,
    required this.color,
    required this.label,
    required this.textStyle,
    required this.destination,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Hero(
      tag: tag,
      child: Container(
        height: 50.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        width: size.width * 0.4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          shadowColor: Colors.black,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            child: Center(
              child: Text(
                label,
                style: textStyle,
              ),
            ),
            onTap: () => context.goNamed(tag),
          ),
        ),
      ),
    );
  }
}
