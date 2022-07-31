import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/eventDao.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/information_dao.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/partner_dao.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/user_account_dao.dart';
import 'package:zlga/acadaar_ctrl/Db/common/EmmadedayoDB.dart';
import 'package:zlga/acadaar_ctrl/common/dr_api_service.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/config/ps_theme_repository.dart';
import 'package:zlga/factory/reprository/app_info_repository.dart';
import 'package:zlga/factory/reprository/clear_all_data_repository.dart';
import 'package:zlga/factory/reprository/event_repository.dart';
import 'package:zlga/factory/reprository/information_repository.dart';
import 'package:zlga/factory/reprository/partner_repository.dart';
import 'package:zlga/factory/reprository/user_reprository.dart';


List<SingleChildWidget> providers = <SingleChildWidget>[
  ...independentProviders,
  ..._dependentProviders,
  ..._valueProviders,

];

List<SingleChildWidget> independentProviders = <SingleChildWidget>[
  Provider<EmmaSharedPreferences>.value(value: EmmaSharedPreferences.instance),
  Provider<DrApiService>.value(value: DrApiService()),
  Provider<EventDao>.value(value: EventDao.instance),
  Provider<InformationDao>.value(value: InformationDao.instance),
  Provider<PartnerDao>.value(value: PartnerDao.instance),
  Provider<UserAccountDao>.value(value: UserAccountDao.instance), //correct type with instance

];

List<SingleChildWidget> _dependentProviders = <SingleChildWidget>[
  ProxyProvider<EmmaSharedPreferences, PsThemeRepository>(
    update: (_, EmmaSharedPreferences ssSharedPreferences,
            PsThemeRepository psThemeRepository) =>
        PsThemeRepository(psSharedPreferences: ssSharedPreferences),
  ),

  ProxyProvider<DrApiService, ClearAllDataRepository>(
    update: (_, DrApiService psApiService,
        ClearAllDataRepository clearAllDataRepository) =>
        ClearAllDataRepository(),
  ),

  ProxyProvider<DrApiService, AppInfoRepository>(
    update:
        (_, DrApiService psApiService, AppInfoRepository appInfoRepository) =>
            AppInfoRepository(psApiService: psApiService),
  ),


  ProxyProvider2<DrApiService, UserAccountDao, UserRepository>(
    update: (_, DrApiService psApiService, UserAccountDao userDao,
        UserRepository userRepository) =>
        UserRepository(drApiService: psApiService, accountDao: userDao),
  ),

  ProxyProvider2<DrApiService, InformationDao, InformationRepository>(
    update: (_, DrApiService psApiService, InformationDao informationDao,
        InformationRepository userRepository) =>
        InformationRepository(drApiService: psApiService, informationDao: informationDao),
  ),

  ProxyProvider2<DrApiService, PartnerDao, PartnerRepository>(
    update: (_, DrApiService psApiService, PartnerDao partnerDao,
        PartnerRepository userRepository) =>
        PartnerRepository(drApiService: psApiService, partnerDao: partnerDao),
  ),

  ProxyProvider2<DrApiService, EventDao, EventRepository>(
    update: (_, DrApiService psApiService, EventDao eventDao,
        EventRepository userRepository) =>
        EventRepository(drApiService: psApiService, eventDao: eventDao),
  ),

];

List<SingleChildWidget> _valueProviders = <SingleChildWidget>[
  StreamProvider<DrValueHolder>(
    initialData: null,
    create: (BuildContext context) =>
    Provider.of<EmmaSharedPreferences>(context, listen: false)
        .psValueHolder,
  )


];
