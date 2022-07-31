
import 'package:zlga/acadaar_ctrl/ObjectHolder/ps_object.dart';

class DrAppInfo extends DrObject<DrAppInfo> {
  DrAppInfo({
    this.id,
    this.appName,
    this.appVersion,
    this.forceUpdate,
    this.loginAgain,
  });

  String id;
  String appName;
  String appVersion;
  String forceUpdate;
  String loginAgain;

  @override
  String getPrimaryKey() {
    return '';
  }

  @override
  DrAppInfo fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return DrAppInfo(
        id : dynamicData['id'],
        appName : dynamicData['app_name'],
        appVersion : dynamicData['app_version'],
        forceUpdate : dynamicData['force_app_update'],
        loginAgain : dynamicData['user_login_again'],
      );
    } else {
      return null;
    }
  }


  @override
  Map<String, dynamic> toMap(dynamic object) {
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};

      data['id'] = this.id;
      data['app_name'] = this.appName;
      data['app_version'] = this.appVersion;
      data['force_app_update'] = this.forceUpdate;
      data['user_login_again'] = this.loginAgain;
      return data;
    } else {
      return null;
    }
  }

  @override
  List<DrAppInfo> fromMapList(List<dynamic> dynamicDataList) {
    final List<DrAppInfo> DrAppInfoList = <DrAppInfo>[];

    if (dynamicDataList != null) {
      for (dynamic json in dynamicDataList) {
        if (json != null) {
          DrAppInfoList.add(fromMap(json));
        }
      }
    }
    return DrAppInfoList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<dynamic> objectList) {
    final List<dynamic> dynamicList = <dynamic>[];
    if (objectList != null) {
      for (dynamic data in objectList) {
        if (data != null) {
          dynamicList.add(toMap(data));
        }
      }
    }

    return dynamicList;
  }
}
