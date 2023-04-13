import 'package:chat/common/values/colors.dart';
import 'package:chat/pages/frame/welcome/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends GetView<ChatController> {
  // const WelcomePage({super.key});
  const ChatPage({Key? key}) : super(key: key);

  AppBar _buildAppBar(){
    return AppBar(
      title:Obx((){
        return Container(
          child: Text(
            "${controller.state.to_name}"
          ),
        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }
}