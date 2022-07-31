import 'dart:io';
import 'package:zlga/acadaar_ctrl/Holder/App_info.dart';
import 'package:zlga/acadaar_ctrl/common/dr_api.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/dr_url.dart';
import 'package:zlga/factory/model/EventModel.dart';
import 'package:zlga/factory/model/InformationModel.dart';
import 'package:zlga/factory/model/PartnerModel.dart';
import 'package:zlga/factory/model/UserModel.dart';

class DrApiService extends DrApi {

  Future<DrResource<DrAppInfo>> postPsAppInfo(Map<dynamic, dynamic> jsonMap) async {
    const String url = '${DrUrl.loading_app_check}';
    return await postData<DrAppInfo, DrAppInfo>(DrAppInfo(), url, jsonMap);
  }

  Future<DrResource<UserModel>> postUserRegister(Map<dynamic, dynamic> jsonMap) async {
    const String url = '${DrUrl.post_register_url}';
    return await postData<UserModel, UserModel>(UserModel(), url, jsonMap);
  }

  Future<DrResource<UserModel>> postUserSignIn(Map<dynamic, dynamic> jsonMap) async {
    const String url = '${DrUrl.post_login_url}';
    return await postData<UserModel, UserModel>(UserModel(), url, jsonMap);
  }

  Future<DrResource<UserModel>> postVerifyAccount(Map<dynamic, dynamic> jsonMap) async {
    const String url = '${DrUrl.post_verify_account}';
    return await postData<UserModel, UserModel>(UserModel(), url, jsonMap);
  }

  Future<DrResource<UserModel>> postForgetAccount(Map<dynamic, dynamic> jsonMap) async {
    const String url = '${DrUrl.post_forgot_account}';
    return await postData<UserModel, UserModel>(UserModel(), url, jsonMap);
  }

  Future<DrResource<UserModel>> postUpdatePassword(Map<dynamic, dynamic> jsonMap) async {
    const String url = '${DrUrl.post_forgot_account}';
    return await postData<UserModel, UserModel>(UserModel(), url, jsonMap);
  }

  Future<DrResource<UserModel>> postRegenerateCode(Map<dynamic, dynamic> jsonMap) async {
    const String url = '${DrUrl.post_regenerate_code}';
    return await postData<UserModel, UserModel>(UserModel(), url, jsonMap);
  }

  Future<DrResource<List<UserModel>>> getUser(String apiSession) async {
    final String url = '${DrUrl.user_profile}';
    return await getServerSessionCall<UserModel, List<UserModel>>(UserModel(), url, apiSession);
  }

  Future<DrResource<UserModel>> postImageUpload(String userId, File imageFile, String apiSession) async {
    final String url = '${DrUrl.user_update_picture}';
    return await postUploadImageSingle<UserModel, UserModel>(UserModel(), url, apiSession, userId, imageFile);
  }

  Future<DrResource<UserModel>> postProfileUpdate(Map<dynamic, dynamic> jsonMap,apiToken) async {
    const String url = '${DrUrl.user_update_profile}';
    return await postSessionData<UserModel, UserModel>(UserModel(), url, apiToken, jsonMap);
  }

  Future<DrResource<UserModel>> updatePassword(Map<dynamic, dynamic> jsonMap,apiToken) async {
    const String url = '${DrUrl.user_update_password}';
    return await postSessionData<UserModel, UserModel>(UserModel(), url, apiToken, jsonMap);
  }

  Future<DrResource<UserModel>> updateSettings(Map<dynamic, dynamic> jsonMap,apiToken) async {
    const String url = '${DrUrl.user_update_settings}';
    return await postSessionData<UserModel, UserModel>(UserModel(), url, apiToken, jsonMap);
  }


  ///GET INFORMATION

  Future<DrResource<List<InformationModel>>> getInformation(String apiSession) async {
    final String url = '${DrUrl.myTaxiHistory}';
    return await getServerSessionCall<InformationModel, List<InformationModel>>(InformationModel(), url, apiSession);
  }

  Future<DrResource<List<EventModel>>> getEvent(String apiSession,String dateParam) async {
    final String url = '${DrUrl.myTaxiHistory}';
    return await getSessionParams<EventModel, List<EventModel>>(EventModel(), url, apiSession, dateParam);
    //return await getServerSessionCall<TaxiRideModel, List<TaxiRideModel>>(TaxiRideModel(), url, apiSession);
  }

  Future<DrResource<List<PartnerModel>>> getPartner(String apiSession) async {
    final String url = '${DrUrl.myFavourite}';
    return await getServerSessionCall<PartnerModel, List<PartnerModel>>(PartnerModel(), url, apiSession);
  }

}
