import 'package:chat/pages/contact/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../common/apis/contact.dart';
import '../../common/entities/contact.dart';
import '../../common/entities/msg.dart';
import '../../common/routes/names.dart';
import '../../common/store/user.dart';

class ContactController extends GetxController {
  ContactController();

  final title = "Chat .";
  final state = ContactState();
  final token = UserStore.to.profile.token;
  final db = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();
    asyncLoadAllData();
  }

  Future<void> goChat(ContactItem contactItem) async {
    var from_messages = await db.collection("message").withConverter(
      fromFirestore: Msg.fromFirestore,
      toFirestore: (Msg msg, options)=>msg.toFirestore(),
      ).where("from_token", isEqualTo: token).where("to_token", 
      isEqualTo: contactItem.token)
      .get();

      var to_messages = await db.collection("message").withConverter(
      fromFirestore: Msg.fromFirestore,
      toFirestore: (Msg msg, options)=>msg.toFirestore(),
      ).where("from_token", isEqualTo: contactItem.token).where("to_token", 
      isEqualTo: token)
      .get();

      if(from_messages.docs.isEmpty&&to_messages.docs.isEmpty){
        var profile = UserStore.to.profile;
        Msg(
          from_token: profile.token,
          to_token: contactItem.token,
          from_name: profile.name,
          to_name: contactItem.name,
          from_avatar: profile.avatar,
          to_avatar: contactItem.avatar,
          from_online: profile.online,
          to_online: contactItem.online,
          last_msg: "",
          last_time: Timestamp.now(),
          msg_num: 0,
        );

        var doc_id = await db.collection("message").withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options)=>msg.toFirestore()
        );
      }
    }

  asyncLoadAllData() async {
    EasyLoading.show(
      indicator:CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true
    );
    state.contactList.clear();
    var result = await ContactAPI.post_contact();
    if (kDebugMode) {
      print(result.data!);
    }
    if(result.code==0){
      state.contactList.addAll(result.data!);
    }
    EasyLoading.dismiss();
  }
}
