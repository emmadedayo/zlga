import 'package:zlga/acadaar_ctrl/Db/common/dr_repository.dart';
import 'package:zlga/acadaar_ctrl/config/dr_config.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrProvider extends ChangeNotifier {
  DrProvider(this.psRepository, int limit) {
    if (limit != 0) {
      this.limit = limit;
    }
  }

  bool isConnectedToInternet = false;
  bool isLoading = false;
  DrRepository psRepository;

  int offset = 0;
  int limit = DrConfig.DEFAULT_LOADING_LIMIT;
  int _cacheDataLength = 0;
  int maxDataLoadingCount = 0;
  int maxDataLoadingCountLimit = 10;
  bool isReachMaxData = false;
  bool isDispose = false;

  void updateOffset(int dataLength) {
    if (offset == 0) {
      isReachMaxData = false;
      maxDataLoadingCount = 0;
    }
    if (dataLength == _cacheDataLength) {
      maxDataLoadingCount++;
      if (maxDataLoadingCount == maxDataLoadingCountLimit) {
        isReachMaxData = true;
      }
    } else {
      maxDataLoadingCount = 0;
    }

    offset = dataLength;
    _cacheDataLength = dataLength;
  }

  Future<void> loadValueHolder() async {
    psRepository.loadValueHolder();
  }

  Future<void> replaceId(String value) async {
    psRepository.replaceId(value);
  }

  Future<void> replaceFirstName(String value) async {
    psRepository.replaceFirstName(value);
  }

  Future<void> replaceLastName(String value) async {
    psRepository.replaceLastName(value);
  }

  Future<void> replaceSession(String value) async {
    psRepository.replaceSession(value);
  }

  Future<void> replaceEmail(String value) async {
    psRepository.replaceEmail(value);
  }

  Future<void> replaceFCM(String value) async {
    psRepository.replaceFCM(value);
  }

  Future<void> replaceUserImage(String value) async {
    psRepository.replaceUserImage(value);
  }

  Future<void> replacePhone(String value) async {
    psRepository.replacePhone(value);
  }

  Future<void> replaceNotification(String value) async {
    psRepository.replaceNotification(value);
  }

  Future<void> replaceLocation(String value) async {
    psRepository.replaceLocation(value);
  }

  Future<void> replacePostAsAnonymous(String value) async {
    psRepository.replacePostAsAnonymous(value);
  }


  Future<void> replaceAppName(String value) async {
    psRepository.replaceAppName(value);
  }


  Future<void> replaceVerifyUserData(
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
    psRepository.replaceVerifyUserData(
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

  Future<void> replaceAppSettings(
      String appName
      ) async {
    psRepository.replaceAPPSettings(
      appName,
    );
  }

}
