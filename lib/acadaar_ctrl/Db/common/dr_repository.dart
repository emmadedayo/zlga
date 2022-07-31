import 'package:zlga/acadaar_ctrl/Db/common/EmmadedayoDB.dart';

class DrRepository {
  void loadValueHolder() {
    EmmaSharedPreferences.instance.loadValueHolder();
  }

  void replaceId(String loginValue) {
    EmmaSharedPreferences.instance.replaceId(
      loginValue,
    );
  }

  void replaceFirstName(String loginValue) {
    EmmaSharedPreferences.instance.replaceFirstName(
      loginValue,
    );
  }

  void replaceLastName(String loginValue) {
    EmmaSharedPreferences.instance.replaceLastName(
      loginValue,
    );
  }

  void replaceSession(String loginValue) {
    EmmaSharedPreferences.instance.replaceSession(
      loginValue,
    );
  }


  void replacePhone(String loginValue) {
    EmmaSharedPreferences.instance.replacePhone(
      loginValue,
    );
  }

  void replaceEmail(String loginValue) {
    EmmaSharedPreferences.instance.replaceEmail(
      loginValue,
    );
  }

  void replaceFCM(String loginValue) {
    EmmaSharedPreferences.instance.replaceFCM(
      loginValue,
    );
  }

  void replaceUserImage(String loginValue) {
    EmmaSharedPreferences.instance.replaceUserImage(
      loginValue,
    );
  }


  void replaceNotification(String loginValue) {
    EmmaSharedPreferences.instance.replaceNotification(
      loginValue,
    );
  }

  void replaceLocation(String loginValue) {
    EmmaSharedPreferences.instance.replaceLocation(
      loginValue,
    );
  }

  void replacePostAsAnonymous(String loginValue) {
    EmmaSharedPreferences.instance.replaceAyn(
      loginValue,
    );
  }




  ///SUPPORT DETAILS

  void replaceAppName(String loginValue) {
    EmmaSharedPreferences.instance.replaceAppName(
      loginValue,
    );
  }


  void replaceVerifyUserData(
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
      ) {
    EmmaSharedPreferences.instance.replaceVerifyUserData(
      userIdToVerify,
      userFirstNameToVerify,
      userLastNameToVerify,
      userEmailToVerify,
      userPhoneToVerify,
      userImage,
      userNotification,
      userLocation,
      userPostAsA,
      userFcmToken,
      userSession,
    );
  }


  void replaceAPPSettings(
      String appName,
      ) {
    EmmaSharedPreferences.instance.replaceAppSettings(
        appName,
    );
  }
}