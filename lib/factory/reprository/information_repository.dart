import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/information_dao.dart';
import 'package:zlga/acadaar_ctrl/Db/common/dr_repository.dart';
import 'package:zlga/acadaar_ctrl/common/dr_api_service.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/acadaar_ctrl/constant/dr_constants.dart';
import 'package:zlga/factory/model/InformationModel.dart';



class InformationRepository extends DrRepository {
  InformationRepository(
      {@required DrApiService drApiService, @required InformationDao informationDao}) {
    _drApiService = drApiService;
    _informationDao = informationDao;
  }

  String primaryKey = 'id';
  DrApiService _drApiService;
  InformationDao _informationDao;

  Future<dynamic> insert(InformationModel data) async {
    return _informationDao.insert(primaryKey, data);
  }

  Future<dynamic> update(InformationModel data) async {
    return _informationDao.update(data);
  }

  Future<dynamic> delete(InformationModel data) async {
    return _informationDao.delete(data);
  }

  Future<dynamic> getPinPoint(
      StreamController<DrResource<List<InformationModel>>> regionListStream,
      String sessionID,
      bool isConnectedToInternet,
      DrStatus status,
      {bool isNeedDelete = true,
        bool isLoadFromServer = true}) async {
    regionListStream.sink.add(await _informationDao.getAll(status: status));

    if (isConnectedToInternet) {
      final DrResource<List<InformationModel>> _resource = await _drApiService.getInformation(sessionID);

      if (_resource.status == DrStatus.SUCCESS) {
        await _informationDao.deleteAll();
        // if (isNeedDelete) {
        //   await _informationDao.deleteAll();
        // }
        await _informationDao.insertAll(primaryKey, _resource.data);
      } else {
        if (_resource.errorCode == DrConst.ERROR_CODE_10001) {
          // Delete and Insert Map Dao
          await _informationDao.deleteAll();
        }
      }
      regionListStream.sink.add(await _informationDao.getAll());
    }
  }



}
