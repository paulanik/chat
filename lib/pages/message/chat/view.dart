import 'package:chat/common/values/colors.dart';
import 'package:chat/pages/frame/welcome/controller.dart';
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



  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      appBar: _buildApp(),
    );
  }
}