import 'dart:async';
import 'dart:convert';

import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/common/utils/utils.dart';
import 'package:zlga/acadaar_ctrl/constant/dr_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmmaSharedPreferences {
  EmmaSharedPreferences._() {
    Utils.psPrint('init PsSharedPreference $hashCode');
    futureShared = SharedPreferences.getInstance();
    futureShared.then((SharedPreferences shared) {
      this.shared = shared;
      //loadUserId('Admin');
      loadValueHolder();
    });
  }

  Future<SharedPreferences> futureShared;
  SharedPreferences shared;

// Singleton instance
  static final EmmaSharedPreferences _singleton = EmmaSharedPreferences._();

  // Singleton accessor
  static EmmaSharedPreferences get instance => _singleton;

  final StreamController<DrValueHolder> _valueController =
      StreamController<DrValueHolder>();

  Stream<DrValueHolder> get psValueHolder => _valueController.stream;


  void loadValueHolder() {
    final String id = shared.getString(DrConst.VALUE_HOLDER__USER_ID);
    final String firstName = shared.getString(DrConst.VALUE_HOLDER__USER_FIRSTNAME);
    final String lastName = shared.getString(DrConst.VALUE_HOLDER__USER_LASTNAME);
    final String email = shared.getString(DrConst.VALUE_HOLDER__USER_EMAIL);
    final String phoneNumber = shared.getString(DrConst.VALUE_HOLDER__USER_PHONE);
    final String userImage = shared.getString(DrConst.VALUE_HOLDER__USER_IMAGE);
    final String notification = shared.getString(DrConst.VALUE_HOLDER__USER_NOTIFICATION);
    final String location = shared.getString(DrConst.VALUE_HOLDER__USER_LOCATION);
    final String postAsAy = shared.getString(DrConst.VALUE_HOLDER__USER_POST_AS_A);
    final String fcmToken = shared.getString(DrConst.VALUE_HOLDER__USER_FCM_TOKEN);
    final String sessionToken = shared.getString(DrConst.VALUE_HOLDER__USER_SESSION);

    final String appName = shared.getString(DrConst.VALUE_HOLDER__APP_NAME);

    final DrValueHolder _valueHolder = DrValueHolder(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      userImage: userImage,
      notification: notification,
      location: location,
      postAsAy: postAsAy,
      fcm: fcmToken,
      sessionToken: sessionToken,
      appName: appName,
    );

    _valueController.add(_valueHolder);
  }


  Future<dynamic> replaceId(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__USER_ID, value);
    loadValueHolder();
  }

  Future<dynamic> replaceFirstName(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__USER_FIRSTNAME, value);
    loadValueHolder();
  }

  Future<dynamic> replaceLastName(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__USER_LASTNAME, value);

    loadValueHolder();
  }

  Future<dynamic> replaceEmail(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__USER_EMAIL, value);

    loadValueHolder();
  }

  Future<dynamic> replacePhone(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__USER_PHONE, value);

    loadValueHolder();
  }

  Future<dynamic> replaceUserImage(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__USER_IMAGE, value);
    loadValueHolder();
  }

  Future<dynamic> replaceNotification(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__USER_NOTIFICATION, value);
    loadValueHolder();
  }

  Future<dynamic> replaceLocation(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__USER_LOCATION, value);
    loadValueHolder();
  }

  Future<dynamic> replaceAyn(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__USER_POST_AS_A, value);
    loadValueHolder();
  }

  Future<dynamic> replaceFCM(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__USER_FCM_TOKEN, value);
    loadValueHolder();
  }


  Future<dynamic> replaceSession(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__USER_SESSION, value);

    loadValueHolder();
  }



  ////////////////////////////////////////////////////////////////// SETTINGS MODEL \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  Future<dynamic> replaceAppName(String value) async {
    await shared.setString(DrConst.VALUE_HOLDER__APP_NAME, value);

    loadValueHolder();
  }



  Future<dynamic> replaceVerifyUserData(
      String userIdToVerify,
      String userFirstNameToVerify,
      String userLastNameToVerify,
      String userEmailToVerify,
      String userPhoneToVerify,
      String userImage,
      String userNotification,
      String userLocation,
      String userPostAsA,
      String userFcmToken,
      String userSession,
      ) async {
    await shared.setString('ID', userIdToVerify);
    await shared.setString('USER_FIRSTNAME_TO_VERIFY', userFirstNameToVerify);
    await shared.setString('USER_LASTNAME_TO_VERIFY', userLastNameToVerify);
    await shared.setString('USER_EMAIL_VERIFY', userEmailToVerify);
    await shared.setString('USER_PHONE', userPhoneToVerify);
    await shared.setString('USER_IMAGE', userImage);
    await shared.setString('USER_NOTIFICATION', userNotification);
    await shared.setString('USER_LOCATION', userLocation);
    await shared.setString('USER_POST_AS', userPostAsA);
    await shared.setString('USER_FCM_TOKEN', userFcmToken);
    await shared.setString('USER_SESSION', userSession);
    loadValueHolder();
  }

  Future<dynamic> replaceAppSettings(
      String appName
      ) async {
    await shared.setString('SETTINGS_APP_NAME', appName);
    loadValueHolder();
  }
}
