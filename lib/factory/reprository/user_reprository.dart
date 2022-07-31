import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sembast/sembast.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/user_account_dao.dart';
import 'package:zlga/acadaar_ctrl/Db/common/dr_repository.dart';
import 'package:zlga/acadaar_ctrl/common/dr_api_service.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/factory/model/UserModel.dart';


class UserRepository extends DrRepository {
  UserRepository(
      {@required DrApiService drApiService, @required UserAccountDao accountDao}) {
    _drApiService = drApiService;
    _accountDao = accountDao;
  }

  DrApiService _drApiService;
  UserAccountDao _accountDao;
  final String _userPrimaryKey = 'id';


  void sinkUserDetailStream(StreamController<DrResource<UserModel>> userListStream,
      DrResource<UserModel> data) {
    if (data != null) {
      userListStream.sink.add(data);
      print('hello ${data.data}');
    }
  }

  Future<dynamic> insert(UserModel user) async {
    return _accountDao.insert(_userPrimaryKey, user);
  }

  Future<dynamic> update(UserModel user) async {
    return _accountDao.update(user);
  }

  Future<dynamic> delete(UserModel user) async {
    return _accountDao.delete(user);
  }


  Future<DrResource<UserModel>> postUserLogin(Map<dynamic, dynamic> jsonMap,
      bool isConnectedToInternet, DrStatus status,
      {bool isLoadFromServer = true}) async {
    final DrResource<UserModel> _resource =
    await _drApiService.postUserSignIn(jsonMap);
    if (_resource.status == DrStatus.SUCCESS) {
      await _accountDao.deleteAll();
      await insert(_resource.data);
      final String userId = _resource.data.id.toString();
      //final UserLogin userLogin = UserLogin(id: userId, login: true, user: _resource.data);
      return _resource;
    } else {
      final Completer<DrResource<UserModel>> completer =
      Completer<DrResource<UserModel>>();
      completer.complete(_resource);
      return completer.future;
    }
  }

  Future<DrResource<UserModel>> postUserRegister(Map<dynamic, dynamic> jsonMap,
      bool isConnectedToInternet, DrStatus status,
      {bool isLoadFromServer = true}) async {
    final DrResource<UserModel> _resource =
    await _drApiService.postUserRegister(jsonMap);
    if (_resource.status == DrStatus.SUCCESS) {
      return _resource;
    } else {
      final Completer<DrResource<UserModel>> completer =
      Completer<DrResource<UserModel>>();
      completer.complete(_resource);
      return completer.future;
    }
  }

  Future<DrResource<UserModel>> postVerifyAccount(Map<dynamic, dynamic> jsonMap,
      bool isConnectedToInternet, DrStatus status,{bool isLoadFromServer = true}) async {
    final DrResource<UserModel> _resource = await _drApiService.postVerifyAccount(jsonMap);
    if (_resource.status == DrStatus.SUCCESS) {
      await _accountDao.deleteAll();
      await insert(_resource.data);
      final String userId = _resource.data.id;
      return _resource;
    } else {
      final Completer<DrResource<UserModel>> completer =
      Completer<DrResource<UserModel>>();
      completer.complete(_resource);
      return completer.future;
    }
  }

  Future<DrResource<UserModel>> postForgetAccount(Map<dynamic, dynamic> jsonMap,
      bool isConnectedToInternet, DrStatus status,
      {bool isLoadFromServer = true}) async {
    final DrResource<UserModel> _resource =
    await _drApiService.postForgetAccount(jsonMap);
    if (_resource.status == DrStatus.SUCCESS) {
      return _resource;
    } else {
      final Completer<DrResource<UserModel>> completer =
      Completer<DrResource<UserModel>>();
      completer.complete(_resource);
      return completer.future;
    }
  }

  Future<DrResource<UserModel>> postUpdatePassword(Map<dynamic, dynamic> jsonMap,
      bool isConnectedToInternet, DrStatus status,
      {bool isLoadFromServer = true}) async {
    final DrResource<UserModel> _resource =
    await _drApiService.postUpdatePassword(jsonMap);
    if (_resource.status == DrStatus.SUCCESS) {
      return _resource;
    } else {
      final Completer<DrResource<UserModel>> completer =
      Completer<DrResource<UserModel>>();
      completer.complete(_resource);
      return completer.future;
    }
  }

  Future<DrResource<UserModel>> postRegenerateCode(Map<dynamic, dynamic> jsonMap,
      bool isConnectedToInternet, DrStatus status,
      {bool isLoadFromServer = true}) async {
    final DrResource<UserModel> _resource =
    await _drApiService.postRegenerateCode(jsonMap);
    if (_resource.status == DrStatus.SUCCESS) {
      return _resource;
    } else {
      final Completer<DrResource<UserModel>> completer =
      Completer<DrResource<UserModel>>();
      completer.complete(_resource);
      return completer.future;
    }
  }

  Future<dynamic> getUser(
      StreamController<DrResource<UserModel>> userListStream,
      String loginUserId,
      String apiToken,
      bool isConnectedToInternet,
      DrStatus status,
      {bool isLoadFromServer = true}) async {
    final Finder finder = Finder(filter: Filter.equals('id', loginUserId));
    sinkUserDetailStream(userListStream, await _accountDao.getOne(finder: finder, status: status));
    if (isConnectedToInternet) {
      final DrResource<List<UserModel>> _resource = await _drApiService.getUser(apiToken);
      if (_resource.status == DrStatus.SUCCESS) {
        await _accountDao.deleteAll();
        await _accountDao.insertAll(_userPrimaryKey, _resource.data);
      } else {
        await _accountDao.deleteAll();
      }
      sinkUserDetailStream(userListStream, await _accountDao.getOne(finder: finder));
    }
  }

  Future<DrResource<UserModel>> postImageUpload(String userId,File imageFile, String apiSession, bool isConnectedToInternet, DrStatus status,
      {bool isLoadFromServer = true}) async {
    final DrResource<UserModel> _resource =
    await _drApiService.postImageUpload(userId, imageFile,apiSession);
    if (_resource.status == DrStatus.SUCCESS) {
      await _accountDao.deleteAll();
      await insert(_resource.data);
      // final String userId = _resource.data.id;
      // final UserLogin userLogin = UserLogin(id: userId, login: true, user: _resource.data);
      // await insert(UserModel);
      return _resource;
    } else {
      final Completer<DrResource<UserModel>> completer =
      Completer<DrResource<UserModel>>();
      completer.complete(_resource);
      return completer.future;
    }
  }

  Future<DrResource<UserModel>> postProfileUpdate(Map<dynamic, dynamic> jsonMap, String apiToken,
      bool isConnectedToInternet, DrStatus status,{bool isLoadFromServer = true}) async {
    final DrResource<UserModel> _resource = await _drApiService.postProfileUpdate(jsonMap,apiToken);
    if (_resource.status == DrStatus.SUCCESS) {
      await _accountDao.deleteAll();
      await insert(_resource.data);
      final String userId = _resource.data.id;
      return _resource;
    } else {
      final Completer<DrResource<UserModel>> completer =
      Completer<DrResource<UserModel>>();
      completer.complete(_resource);
      return completer.future;
    }
  }

  Future<DrResource<UserModel>> postUpdateSettings(Map<dynamic, dynamic> jsonMap, String apiToken,
      bool isConnectedToInternet, DrStatus status,{bool isLoadFromServer = true}) async {
    final DrResource<UserModel> _resource = await _drApiService.updateSettings(jsonMap,apiToken);
    if (_resource.status == DrStatus.SUCCESS) {
      await _accountDao.deleteAll();
      await insert(_resource.data);
      final String userId = _resource.data.id;
      return _resource;
    } else {
      final Completer<DrResource<UserModel>> completer =
      Completer<DrResource<UserModel>>();
      completer.complete(_resource);
      return completer.future;
    }
  }


  Future<DrResource<UserModel>> updatePassword(Map<dynamic, dynamic> jsonMap, String apiToken,
      bool isConnectedToInternet, DrStatus status,{bool isLoadFromServer = true}) async {
    final DrResource<UserModel> _resource = await _drApiService.updatePassword(jsonMap,apiToken);
    if (_resource.status == DrStatus.SUCCESS) {
      await _accountDao.deleteAll();
      await insert(_resource.data);
      final String userId = _resource.data.id;
      return _resource;
    } else {
      final Completer<DrResource<UserModel>> completer =
      Completer<DrResource<UserModel>>();
      completer.complete(_resource);
      return completer.future;
    }
  }


}
