// Copyright (c) 2019, the Acadaar.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// Acadaar license that can be found in the LICENSE file.


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:intl/intl.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';

class DrConfig {
  DrConfig._();

  static const String app_name = 'zlga';

  ///
  /// AppVersion
  /// For your app, you need to change according based on your app version
  ///
  static const String app_version = 'v1.0';

  ///
  /// API Key
  /// If you change here, you need to update in server.
  ///
  static const String dr_api_key = 'AEAA654A9D7A51E4C16A1561BA958-427FBC89EE4BE1F4FFBDD3A3F2FC4-11DBCB3D97A29458-A68791668DE3B5AB-64944F698754CD66-'
      'CCFDA5AB7EA324835F7CA938A1923-DB983F799811893C3435148C43B22-94A2C46B7A457154193B321B6DCE1-CC1577E56D65358431F67FD5A9418-C478F46BD7E39364-'
      '3EBBEBF9D8B9CB4F-1DC5D7B4DF84F238-5EC137CD79346-777FBC1162551-DBFEC8A7B7671-D39FB-E8E4B-127E8';

  ///
  /// API URL
  /// Change your backend url
  ///
  static const String dr_app_url_non_auth = 'https://api.folo.com.ng/zlga/';

  static const String dr_app_url_auth = 'https://api.folo.com.ng/new/zlga/';
  //pk_live_e8e6c7715e74a2dabeee9e125a82f749309ee89f
  static const String dr_pay_stack_key = 'pk_test_f1d24247bbff1b2fddb9246b4b3b58021ee94b7d';

  static const String dr_vt_pass_username = 'support@zlga.com';

  static const String dr_vt_pass_password = 'ZeroWaste2021';

  ///
  /// Animation Duration
  ///
  static const Duration animation_duration = Duration(milliseconds: 1000);


  ///
  /// Fonts Family Config
  /// Before you declare you here,
  /// 1) You need to add font under assets/fonts/
  /// 2) Declare at pubspec.yaml
  /// 3) Update your font family name at below
  ///
  static const String dr_default_font_family = 'Montserrat';

  /// Default Language
// static const dr_default_language = 'en';

// static const dr_language_list = [Locale('en', 'US'), Locale('ar', 'DZ')];
  static const String dr_app_db_name = 'acadaar_zlga.db';


  ///
  /// Price Format
  /// Need to change according to your format that you need
  /// E.g.
  /// ",##0.00"   => 2,555.00
  /// "##0.00"    => 2555.00
  /// ".00"       => 2555.00
  /// ",##0"      => 2555
  /// ",##0.0"    => 2555.0
  ///
  static const String priceFormat = ',###.00';

  ///
  /// Date Time Format
  ///
  static const String dateFormat = 'dd-MM-yyyy hh:mm:ss';

  ///
  /// iOS App No
  ///
  static const String iOSAppStoreId = '000000000';

  ///
  /// Facebook Key
  ///
  static const String fbKey = '1395137620874464';


  ///
  /// Image Loading
  ///
  /// - If you set "true", it will load thumbnail image first and later it will
  ///   load full image
  /// - If you set "false", it will load full image directly and for the
  ///   placeholder image it will use default placeholder Image.
  ///
  static const bool USE_THUMBNAIL_AS_PLACEHOLDER = true;

  ///
  /// ERROR STREAM VERIFIED
  ///
  ///
  static const String VERIFY_ERROR_STATUS_CODE = "ERROR-100";

  ///
  /// ERROR STREAM VERIFIED
  ///
  ///
  static const String ACCOUNT_ERROR_STATUS_CODE = "ERROR-101";

  ///
  /// Image Size
  ///
  static const int uploadImageSize = 1024;
  static const int profileImageSize = 512;



  ///
  /// ShowSubCategory
  ///
  static const bool isShowSubCategory = true;

  ///
  /// Map Filter Setting
  ///
  static bool noFilterWithLocationOnMap = false;


  ///
  /// Tmp Image Folder Name
  ///
  static const String tmpImageFolderName = 'zlga';

  static const int DEFAULT_LOADING_LIMIT = 30;

  static String getImage(String name){
    return 'assets/image/'+name;
  }

  static String getIcon(String name){
    return 'assets/icon/'+name;
  }

  static const String apiKey = 'AIzaSyC0UtbMhFm2RDN9ix0hINwlYexT8saQdb0';
  static const String language = 'en';
  static const String region = 'NG';
//AIzaSyCMV3P3ybKFAbf7XXEJGijAzuMymwUd440
  static contentSpace(double num){
    return SizedBox(
      height: num,
    );
  }

  static contentSpaceDivider(double num,Color colors){
    return Divider(
      height: num,
      color: colors,
    );
  }

  static dateFormatToString(date){
    final dateFormatter = DateFormat('yyyy-MM-dd');
    var dateString = dateFormatter.format(DateTime.parse(date));
    return dateString;
  }

  static capitalLetter(String value) {
    return value.substring(0, 1).toUpperCase() +
        value.substring(1, value.length);
  }


  static String formatDistance(double distance){
    if(distance>1000){
      distance = distance/1000;
      return (distance).toStringAsFixed(distance.truncateToDouble() == distance ? 0 : 2) + " KM";
    }else{
      return distance.floor().toString() + " Meter";
    }
  }

  static double calculateDistance(lat1, lon1, lat2, lon2){

    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  }

  static String durationToString(minutes) {

    var d = Duration(minutes:minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';

  }

  static double calculateDistanceBetweenTwoLtnLng(LatLng origin,LatLng destination){
    double lat1 = origin.latitude;
    double lon1 = origin.longitude;
    double lat2 = destination.latitude;
    double lon2 = destination.longitude;

    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

}
