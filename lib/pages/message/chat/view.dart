import 'package:cached_network_image/cached_network_image.dart';
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
            "${controller.state.to_name}",
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: TextStyle(
              fontFamily: "Avenir",
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
              fontSize: 16.sp
            ),
          ),
        );
      }),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                child: CachedNetworkImage(
                  imageUrl: controller.state.to_avatar.value,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.w),
                      image: DecorationImage(
                        image: imageProvider
                      )
                    ),
                  ),
                  errorWidget:(context, url, error) => Image(image: 
                  AssetImage('assets/images/account_header.png')
                  ),
                ),
              ),
            Positioned(
              bottom: 5.w,
              right: 0.w,
              height: 14.w,
              child: Container(
                width: 15.w,
                height: 14.w,
                decoration: BoxDecoration(
                  color: controller.state.to_online.value=="1"?AppColors.primaryElementStatus:
                  AppColors.primarySecondaryElementText,
                  borderRadius: BorderRadius.circular(12.w),
                  border: Border.all(width: 2, color: AppColors.primaryElementText)
                ),
              ),
            )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0.h,
              child: Container(
                width: 360.w,
                padding: EdgeInsets.only(left: 20.w, bottom: 10.w),
               child: Row(
                  children: [
                    Container(
                      width: 270.w,
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        color: AppColors.primaryBackground,
                        border: Border.all(color: AppColors.primarySecondaryElementText)
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 220.w,
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Message...",
                                contentPadding: EdgeInsets.only(
                                  left: 15.w, top:0, bottom: 0,
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )
                                ),
                              ),
                            ),
                          )
                        ]
                      ),
                    )
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}