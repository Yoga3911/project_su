import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/color.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final spinkit = SpinKitCircle(
      itemBuilder: (BuildContext context, int index) => DecoratedBox(
        decoration:
            BoxDecoration(color: index.isEven ? MyColor.blue : Colors.black),
      ),
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size.height * 0.2,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              spinkit,
              Text(
                "Proses ...",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
