import 'package:chat/common/entities/entities.dart';
import 'package:chat/common/utils/utils.dart';

class ContactAPI {
  /// contact page
  /// get all the contact of users info
  static Future<ContactResponseEntity> post_contact() async {
    var response = await HttpUtil().post(
      'api/contact',
    );
    return ContactResponseEntity.fromJson(response);
  }


}
