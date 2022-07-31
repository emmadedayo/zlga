import 'package:quiver/core.dart';
import 'package:zlga/acadaar_ctrl/ObjectHolder/ps_object.dart';


class UserModel extends DrObject<UserModel> {
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.accountStatus,
    this.userImage,
    this.notification,
    this.location,
    this.postAsAnonymous,
    this.fcmToken,
    this.token,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String accountStatus;
  String userImage;
  String notification;
  String location;
  String postAsAnonymous;
  String fcmToken;
  String token;

  @override
  bool operator ==(dynamic other) => other is UserModel && id == other.id;

  @override
  int get hashCode {
    return hash2(id.hashCode, id.hashCode);
  }

  @override
  String getPrimaryKey() {
    return id;
  }

  @override
  UserModel fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return UserModel(
        id: dynamicData['id'],
        firstName: dynamicData['first_name'],
        lastName: dynamicData['last_name'],
        email: dynamicData['email'],
        phoneNumber: dynamicData['phone_number'],
        accountStatus: dynamicData['account_status'],
        userImage: dynamicData['user_image'],
        notification: dynamicData['notification'],
        location: dynamicData['location'],
        postAsAnonymous: dynamicData['post_as_anonymous'],
        fcmToken: dynamicData['fcm_token'],
        token: dynamicData['token'],
      );
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic> toMap(UserModel object) {
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = object.id;
      data['first_name'] = object.firstName;
      data['last_name'] = object.lastName;
      data['email'] = object.email;
      data['phone_number'] = object.phoneNumber;
      data['account_status'] = object.accountStatus;
      data['user_image'] = object.userImage;
      data['notification'] = object.notification;
      data['location'] = object.location;
      data['post_as_anonymous'] = object.postAsAnonymous;
      data['fcm_token'] = object.fcmToken;
      data['token'] = object.token;
      return data;
    } else {
      return null;
    }
  }

  @override
  List<UserModel> fromMapList(List<dynamic> dynamicDataList) {
    final List<UserModel> subBankModelList = <UserModel>[];

    if (dynamicDataList != null) {
      for (dynamic dynamicData in dynamicDataList) {
        if (dynamicData != null) {
          subBankModelList.add(fromMap(dynamicData));
        }
      }
    }
    return subBankModelList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<UserModel> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (UserModel data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}
