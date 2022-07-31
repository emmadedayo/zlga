import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/information_dao.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/partner_dao.dart';
import 'package:zlga/acadaar_ctrl/Db/common/dr_repository.dart';
import 'package:zlga/acadaar_ctrl/common/dr_api_service.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/acadaar_ctrl/constant/dr_constants.dart';
import 'package:zlga/factory/model/PartnerModel.dart';


class PartnerRepository extends DrRepository {
  PartnerRepository(
      {@required DrApiService drApiService, @required PartnerDao partnerDao}) {
    _drApiService = drApiService;
    _partnerDao = partnerDao;
  }

  String primaryKey = 'id';
  DrApiService _drApiService;
  PartnerDao _partnerDao;

  Future<dynamic> insert(PartnerModel data) async {
    return _partnerDao.insert(primaryKey, data);
  }

  Future<dynamic> update(PartnerModel data) async {
    return _partnerDao.update(data);
  }

  Future<dynamic> delete(PartnerModel data) async {
    return _partnerDao.delete(data);
  }

  Future<dynamic> getPartner(
      StreamController<DrResource<List<PartnerModel>>> regionListStream,
      String sessionID,
      bool isConnectedToInternet,
      DrStatus status,
      {bool isNeedDelete = true,
        bool isLoadFromServer = true}) async {
    regionListStream.sink.add(await _partnerDao.getAll(status: status));

    if (isConnectedToInternet) {
      final DrResource<List<PartnerModel>> _resource = await _drApiService.getPartner(sessionID);

      if (_resource.status == DrStatus.SUCCESS) {
        await _partnerDao.deleteAll();
        await _partnerDao.insertAll(primaryKey, _resource.data);
      } else {
        if (_resource.errorCode == DrConst.ERROR_CODE_10001) {
         await _partnerDao.deleteAll();
        }
      }
      regionListStream.sink.add(await _partnerDao.getAll());
    }
  }



}
