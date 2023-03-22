import 'package:chat/common/routes/names.dart';
import 'package:chat/pages/frame/welcome/state.dart';
import 'package:chat/pages/profile/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/store/user.dart';

class ProfileController extends GetxController {
  ProfileController();
  final title = "Chat .";
  final state = ProfileState();

  // @override
  // void onReady() {
  //   super.onReady();
  //   // print(" WelcomeController ");
  //   Future.delayed(
  //       const Duration(seconds: 3), () => Get.offAllNamed(AppRoutes.Message));
  // }

  Future<void> goLogout() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }
}
