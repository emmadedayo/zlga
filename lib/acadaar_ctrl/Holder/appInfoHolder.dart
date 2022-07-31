import 'package:flutter/cupertino.dart';
import 'package:zlga/acadaar_ctrl/ObjectHolder/ps_holder.dart';

class AppInfoParameterHolder extends DrHolder<AppInfoParameterHolder> {
  AppInfoParameterHolder(
      {@required this.userId,@required this.countryID});

  final String userId;
  final String countryID;

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['id'] = userId;
    map['country_id'] = countryID;

    return map;
  }

  @override
  AppInfoParameterHolder fromMap(dynamic dynamicData) {
    return AppInfoParameterHolder(
      userId: dynamicData['id'],
      countryID: dynamicData['country_id'],
    );
  }

  @override
  String getParamKey() {
    String key = '';
    if (userId != '') {
      key += userId;
    }
    return key;
  }
}
