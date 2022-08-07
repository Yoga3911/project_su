import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:project/constants/color.dart';
import 'package:project/constants/fonts.dart';
import 'package:project/presentation/pages/auth/login.dart';
import 'package:project/presentation/pages/auth/register.dart';
import 'package:project/routes/routes.dart';

import 'background.dart';
import 'custom_btn.dart';
import 'gradient.dart';

class LandingContent extends StatelessWidget {
  const LandingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        const BackgroundContent(),
        for (int i = 0; i < 5; i++) const GradientContent(),
        Align(
          alignment: const Alignment(0, -0.25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                "assets/images/city.json",
                fit: BoxFit.cover,
                height: 100.h,
                width: 100.w,
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        Align(
          alignment: const Alignment(0, 0.9),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                color: MyColor.blue,
                label: "Masuk",
                textStyle: textTheme.bodyText1,
                destination: MyRoute.login,
                tag: LoginPage.routeName,
              ),
              SizedBox(height: 15.h),
              CustomButton(
                color: Colors.white,
                label: "Daftar",
                textStyle: textTheme.bodyText2,
                destination: MyRoute.register,
                tag: RegisterPage.routeName,
              ),
              SizedBox(height: 15.h),
              Text(
                "Sari Nikmat",
                style: TextStyle(
                  fontFamily: MyFont.regular,
                  fontSize: 16.sp,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
