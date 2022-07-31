import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flash/flash.dart';
import 'package:logger/logger.dart';
import 'package:zlga/acadaar_ctrl/common/api_status.dart';
import 'package:zlga/acadaar_ctrl/common/dr_provider.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/common/utils/ps_progress_dialog.dart';
import 'package:zlga/acadaar_ctrl/common/utils/utils.dart';
import 'package:zlga/factory/model/UserModel.dart';
import 'package:zlga/factory/reprository/user_reprository.dart';

class UserProvider extends DrProvider {
  UserProvider(
      {@required UserRepository repo,
        @required this.psValueHolder,
        int limit = 0})
      : super(repo, limit) {
    _repo = repo;
    isDispose = false;
    print('User Provider: $hashCode');
    userListStream = StreamController<DrResource<UserModel>>.broadcast();

    subscription = userListStream.stream.listen((DrResource<UserModel> resource) {

      if (resource != null && resource.data != null) {
        _user = resource;
        holderUser = resource.data;

        replaceId(_user.data.id);
        replaceFirstName(_user.data.firstName);
        replaceLastName(_user.data.lastName);
        replaceEmail(_user.data.email);
        replacePhone(_user.data.phoneNumber);
        replaceLocation(_user.data.location);
        replaceNotification(_user.data.notification);
        replacePostAsAnonymous(_user.data.postAsAnonymous);
        replaceSession(_user.data.token == null?'false':_user.data.token);
        replaceFCM(_user.data.fcmToken == null?'x':_user.data.fcmToken);
        replaceUserImage(_user.data.userImage);
        notifyListeners();
        //databaseService.updateUser(user.data.userId, user.data.userRating, user.data.isVerified, user.data.accountStatus);
        print('User Provider po: $holderUser');
      }

      if (resource.status != DrStatus.BLOCK_LOADING &&
          resource.status != DrStatus.PROGRESS_LOADING) {
        isLoading = false;
      }

      if (!isDispose) {
        if (_user != null && _user.data != null) {

          notifyListeners();
        }
      }
    });
  }

  UserRepository _repo;
  DrValueHolder psValueHolder;
  UserModel holderUser;
  bool isCheckBoxSelect = true;

  DrResource<UserModel> _user = DrResource<UserModel>(DrStatus.NOACTION, '', null);
  DrResource<UserModel> _holderUser = DrResource<UserModel>(DrStatus.NOACTION, '', null);

  DrResource<UserModel> get user => _user;
  DrResource<ApiStatus> _apiStatus =
  DrResource<ApiStatus>(DrStatus.NOACTION, '', null);
  DrResource<ApiStatus> get apiStatus => _apiStatus;
  StreamSubscription<DrResource<UserModel>> subscription;
  StreamController<DrResource<UserModel>> userListStream;
  //DatabaseService databaseService;

//  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void dispose() {
    subscription.cancel();
    isDispose = true;
    print('User Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> postUserRegister(
      Map<dynamic, dynamic> jsonMap,
      ) async {
    isLoading = true;

    isConnectedToInternet = await Utils.checkInternetConnectivity();

    _user = await _repo.postUserRegister(
        jsonMap, isConnectedToInternet, DrStatus.PROGRESS_LOADING);

    return _user;
  }

  Future<dynamic> postUserLogin(
      Map<dynamic, dynamic> jsonMap,
      ) async {
    isLoading = true;

    isConnectedToInternet = await Utils.checkInternetConnectivity();

    _user = await _repo.postUserLogin(
        jsonMap, isConnectedToInternet, DrStatus.PROGRESS_LOADING);
    return _user;
  }



  Future<dynamic> postRegenerateCode(
      Map<dynamic, dynamic> jsonMap,String apiToken,
      ) async {
    isLoading = true;
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    _holderUser = await _repo.postRegenerateCode(jsonMap, isConnectedToInternet, DrStatus.SUCCESS);
    if (_holderUser.status == DrStatus.SUCCESS) {
      _user = _holderUser;
      return _holderUser;
    } else {
      return _holderUser;
    }
  }

  Future<dynamic> postUpdatePassword(
      Map<dynamic, dynamic> jsonMap,String apiToken,
      ) async {
    isLoading = true;
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    _holderUser = await _repo.postUpdatePassword(jsonMap, isConnectedToInternet, DrStatus.SUCCESS);
    if (_holderUser.status == DrStatus.SUCCESS) {
      _user = _holderUser;
      return _holderUser;
    } else {
      return _holderUser;
    }
  }

  Future<dynamic> postForgetAccount(
      Map<dynamic, dynamic> jsonMap,String apiToken,
      ) async {
    isLoading = true;
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    _holderUser = await _repo.postForgetAccount(jsonMap, isConnectedToInternet, DrStatus.SUCCESS);
    if (_holderUser.status == DrStatus.SUCCESS) {
      _user = _holderUser;
      return _holderUser;
    } else {
      return _holderUser;
    }
  }



  Future<DrResource<UserModel>> _submitLoginWithEmailId(
      String email, String password) async {
    final DrResource<UserModel> _apiStatus =
    await postUserLogin({"email": email, "password": password});

    if (_apiStatus.data != null) {
      //
      replaceVerifyUserData(
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      );


      replaceId(_user.data.id);
      replaceFirstName(_user.data.firstName);
      replaceLastName(_user.data.lastName);
      replaceEmail(_user.data.email);
      replacePhone(_user.data.phoneNumber);
      replaceLocation(_user.data.location);
      replaceNotification(_user.data.notification);
      replacePostAsAnonymous(_user.data.postAsAnonymous);
      replaceSession(_user.data.token == null?'false':_user.data.token);
      replaceFCM(_user.data.fcmToken == null?'x':_user.data.fcmToken);
      replaceUserImage(_user.data.userImage);

      /// image, planId,rating,is_verified
    }
    return _apiStatus;
  }


  Future<void> loginWithEmailId(BuildContext context, String email,
      String password) async {
    if (await Utils.checkInternetConnectivity()) {
      await PsProgressDialog.showDialog(context);
      final DrResource<UserModel> resourceUser = await _submitLoginWithEmailId(email, password);
      PsProgressDialog.dismissDialog();
      if (resourceUser != null && resourceUser.data != null) {

        // final Map<String, dynamic> params = <String, dynamic>{
        //   "id": resourceUser.data.id,
        //   "email": resourceUser.data.email,
        //   "fullName": resourceUser.data.fullName,
        //   "deviceToken": resourceUser.data.fcmToken,
        //   "userPicture": resourceUser.data.userImage,
        //   "userBalance": resourceUser.data.accountBalance.toString(),
        //   "userRating": resourceUser.data.userRating,
        //   "userVerified": resourceUser.data.verifiedStatus,
        //   "userBan":resourceUser.data.accountStatus,
        //   "userPlanID": resourceUser.data.planId,
        //   "userID": resourceUser.data.userId,
        // };
        // Utils.fmcLoginConfigure('user',resourceUser.data.userId,params);

        // Navigator.of(context)
        //     .pushAndRemoveUntil(
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             RootBottom()), (
        //     Route<dynamic> route) => false);

      } else {
        if (resourceUser != null && resourceUser.message != null) {
          PsProgressDialog.dismissDialog();
          context.showErrorBar(content: Text(resourceUser.message));
        } else {
          PsProgressDialog.dismissDialog();
          context.showErrorBar(content: Text(resourceUser.message));
        }
      }
    }
  }


  Future<void> signUpWithEmailId(
      BuildContext context,
      Function onRegisterSelected,
      String fullName,
      String email,
      String phoneNumber,
      String state,
      String passWord,
      String fcmToken) async {
    if (await Utils.checkInternetConnectivity()) {
      await PsProgressDialog.showDialog(context);

      final DrResource<UserModel> resourceUser = await _submitSignUpWithEmailId(
          context, onRegisterSelected, fullName, email, phoneNumber,state,passWord,fcmToken);

      PsProgressDialog.dismissDialog();

      if (resourceUser != null && resourceUser.data != null) {
        if (onRegisterSelected != null) {
          await onRegisterSelected(resourceUser.data.id);
        } else {
          context.showSuccessBar(content: Text("Registration was successful,"));

          // Navigator.of(context)
          //     .pushAndRemoveUntil(
          //     MaterialPageRoute(
          //         builder: (context) =>
          //             AccountVerificationController(data:resourceUser.data.email)), (
          //     Route<dynamic> route) => false);

        }
      } else {
        if (resourceUser != null && resourceUser.message != null) {
          context.showErrorBar(content: Text(resourceUser != null ? resourceUser.message : ""));

        } else {
          context.showErrorBar(content: Text(resourceUser.message,));
        }
      }
    } else {
      context.showErrorBar(content: Text('Check your internet'));

    }
  }

  Future<DrResource<UserModel>> _submitSignUpWithEmailId(
      BuildContext context,
      Function onRegisterSelected,
      String name,
      String email,
      String phoneNumber,
      String state,
      String passWord,
      String fcmToken) async {
    final DrResource<UserModel> _apiStatus = await postUserRegister({
      "fullname": name,
      "email": email,
      "fcm_token": fcmToken,
      "password": passWord,
      "phone_number": phoneNumber,
      "state_id": state,
    });

    if (_apiStatus.data != null) {
      final UserModel user = _apiStatus.data;
    }
    return _apiStatus;
  }



  Future<dynamic> postVerifyAccount(
      Map<dynamic, dynamic> jsonMap
      ) async {
    isLoading = true;

    isConnectedToInternet = await Utils.checkInternetConnectivity();
    _holderUser = await _repo.postVerifyAccount(jsonMap, isConnectedToInternet, DrStatus.SUCCESS);
    if (_holderUser.status == DrStatus.SUCCESS) {



      _user = _holderUser;
      return _holderUser;
    } else {
      return _holderUser;
      // _user = _holderUser;
      // return _holderUser;
    }
  }

  Future<dynamic> myProfile(String loginUserId, String apiToken) async {
    isLoading = true;
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    _user = await _repo.getUser(userListStream, loginUserId, apiToken,isConnectedToInternet, DrStatus.PROGRESS_LOADING);
    return _user;
  }

  Future<dynamic> postImageUpload(
      String userId,
      File imageFile,
      String apiSession,
      ) async {
    isLoading = true;
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    _user = await _repo.postImageUpload(userId, imageFile,apiSession, isConnectedToInternet, DrStatus.PROGRESS_LOADING);
    //databaseService.updateUserImage(_user.data.userId,_user.data.userImage);
    return _user;
  }

  Future<dynamic> postProfileUpdate(
      Map<dynamic, dynamic> jsonMap,String apiToken,
      ) async {
    isLoading = true;

    isConnectedToInternet = await Utils.checkInternetConnectivity();
    _holderUser = await _repo.postProfileUpdate(
        jsonMap, apiToken, isConnectedToInternet, DrStatus.SUCCESS);
    if (_holderUser.status == DrStatus.SUCCESS) {

        replaceId(_user.data.id);
        replaceFirstName(_user.data.firstName);
        replaceLastName(_user.data.lastName);
        replaceEmail(_user.data.email);
        replacePhone(_user.data.phoneNumber);
        replaceLocation(_user.data.location);
        replaceNotification(_user.data.notification);
        replacePostAsAnonymous(_user.data.postAsAnonymous);
        replaceSession(_user.data.token == null?'false':_user.data.token);
        replaceFCM(_user.data.fcmToken == null?'x':_user.data.fcmToken);
        replaceUserImage(_user.data.userImage);
//      databaseService.updateUserProfile(_holderUser.data.userId, jsonMap);

      _user = _holderUser;
      return _holderUser;
    } else {
      return _holderUser;
    }
  }


  Future<dynamic> updatePassword(
      Map<dynamic, dynamic> jsonMap,String apiToken,
      ) async {
    isLoading = true;
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    _holderUser = await _repo.updatePassword(
        jsonMap, apiToken, isConnectedToInternet, DrStatus.SUCCESS);
    if (_holderUser.status == DrStatus.SUCCESS) {
      _user = _holderUser;
      return _holderUser;
    } else {
      return _holderUser;
    }
  }

  Future<dynamic> postUpdateSettings(
      Map<dynamic, dynamic> jsonMap,String apiToken,
      ) async {
    isLoading = true;
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    _holderUser = await _repo.updatePassword(
        jsonMap, apiToken, isConnectedToInternet, DrStatus.SUCCESS);
    if (_holderUser.status == DrStatus.SUCCESS) {
      _user = _holderUser;
      return _holderUser;
    } else {
      return _holderUser;
    }
  }

}
