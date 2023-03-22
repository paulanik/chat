import 'package:chat/common/routes/names.dart';
import 'package:chat/pages/message/state.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  MessageController();
  final state = MessageState();

  void goProfile() async{
   await Get.toNamed(AppRoutes.Profile);
  }

}
