import 'package:chat/common/routes/names.dart';
import 'package:chat/pages/frame/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  final title = "Chat .";
  final state = WelcomeState();

  @override
  void onReady() {
    super.onReady();
    // print(" WelcomeController ");
    Future.delayed(
        const Duration(seconds: 3), () => Get.offAllNamed(AppRoutes.Message));
  }
}
