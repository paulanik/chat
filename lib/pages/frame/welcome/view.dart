import 'package:chatty/common/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends GetView<WelcomeController> {
  // const WelcomePage({super.key});
  const WelcomePage({Key? key}) : super(key: key);

  Widget _buildPageHeadTitle(String title){
    return Container(
      margin: EdgeInsets.only(top: 350),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryElementText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
          fontSize: 45.sp
        ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      backgroundColor: AppColors.primaryElement,
      body:Container(
        width: 360.w,
        height: 780.h,
        child: _buildPageHeadTitle(controller.title),
      )
    );
  }
}