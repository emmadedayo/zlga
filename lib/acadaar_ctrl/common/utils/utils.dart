import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:date_time_format/date_time_format.dart';
import 'package:zlga/Factory/Model/UserModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:zlga/acadaar_ctrl/ObjectHolder/ps_object.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/config/dr_config.dart';
import 'package:zlga/acadaar_ctrl/constant/dr_constants.dart';
import 'package:zlga/acadaar_ctrl/constant/route_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:launch_review/launch_review.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  Utils._();


  static showToast(BuildContext context,String key, String message){
    if(key == "success"){
      return Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else if(key == "error"){
      return Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else if(key == "info"){
      return Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  static String getString(BuildContext context, String key) {
    if (key != '') {
      return (key) ?? '';
    } else {
      return '';
    }
  }

  static DateTime previous;

  static void psPrint(String msg) {
    final DateTime now = DateTime.now();
    int min = 0;
    if (previous == null) {
      previous = now;
    } else {
      min = now.difference(previous).inMilliseconds;
      previous = now;
    }

    print('$now ($min)- $msg');
  }

  static String getPriceFormat(String price) {
    return DrConst.psFormat.format(double.parse(price));
  }

  static String getPriceTwoDecimal(String price) {
    return DrConst.priceTwoDecimalFormat.format(double.parse(price));
  }

  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static String getDateFormat(String dateTime) {
    final DateTime date = DateTime.parse(dateTime);
    return DateFormat(DrConfig.dateFormat).format(date);
  }

  static String getTimeOfDayFormat(TimeOfDay tod) {
    final DateTime now = DateTime.now();
    final DateTime dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final DateFormat format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  static String getTime2String(String dateTime){
    final DateTime date = DateTime.parse(dateTime);
    return DateFormat.jm().format(date);
  }

  static String getDateFormatString(String dateTime) {
    final DateTime date = DateTime.parse(dateTime);
    return DateTimeFormat.format(date, format: AmericanDateFormats.standardWithComma);
  }

  static String convertColorToString(Color color) {
    String convertedColorString = '';

    String colorString = color.toString().toUpperCase();

    colorString = colorString.replaceAll(')', '');

    convertedColorString = colorString.substring(colorString.length - 6);

    return '#' + convertedColorString;
  }

  static Future<bool> requestWritePermission() async {
    final Permission _storage = Permission.storage;
    final PermissionStatus permissionss = await _storage.request();

    if (permissionss != null && permissionss == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  static Future<File> getImageFileFromAssets(Asset asset, int imageSize) async {
    final int imageWidth = imageSize;

    final ByteData byteData = await asset.getByteData(quality: 80);

    final bool status = await Utils.requestWritePermission();

    if (status) {
      final Directory _appTempDir = await getTemporaryDirectory();

      final Directory _appTempDirFolder =
          Directory('${_appTempDir.path}/${DrConfig.tmpImageFolderName}');

      if (!_appTempDirFolder.existsSync()) {
        await _appTempDirFolder.create(recursive: true);
      }
      final File file = File('${_appTempDirFolder.path}/${asset.name}');
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      print(file.path);
      final ImageProperties properties =
          await FlutterNativeImage.getImageProperties(file.path);
      final File compressedFile = await FlutterNativeImage.compressImage(
          file.path,
          quality: 80,
          targetWidth: imageWidth,
          targetHeight:
              (properties.height * imageWidth / properties.width).round());

      final ImageProperties properties2 =
          await FlutterNativeImage.getImageProperties(compressedFile.path);
      print('width : ${properties2.width}');
      return compressedFile;
    } else {
      // Toast
      // We don't have permission to read/write images.
      Fluttertoast.showToast(
          msg: 'We don\'t have permission to read/write images.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white);
      return null;
    }

    // });
    // return null;
  }

  static Brightness getBrightnessForAppBar(BuildContext context) {
    if (Platform.isAndroid) {
      return Brightness.dark;
    } else {
      return Theme.of(context).brightness;
    }
  }

  static int getTimeStampDividedByOneThousand(DateTime dateTime) {
    final double dividedByOneThousand = dateTime.millisecondsSinceEpoch / 1000;
    final int doubleToInt = dividedByOneThousand.round();
    return doubleToInt;
  }

  static getTimeStampToDate(currentPhoneDate){
    var date = DateTime.fromMillisecondsSinceEpoch(currentPhoneDate * 1000); //To TimeStamp
    return date.toString();
  }


  static Future<bool> checkInternetConnectivity() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      print('No Connection');
      return false;
    } else {
      return false;
    }
  }

  static Future<bool> getLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  // static dynamic launchURL() async {
  //   final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   print(packageInfo.packageName);
  //   final String url =
  //       'https://play.google.com/store/apps/details?id=${packageInfo.packageName}';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  static dynamic launchAppStoreURL(
      {String iOSAppId, bool writeReview = false}) async {
    LaunchReview.launch(writeReview: writeReview, iOSAppId: iOSAppId);
  }

  static dynamic navigateOnUserVerificationView(
      dynamic provider, BuildContext context, Function onLoginSuccess) async {
    provider.psValueHolder = Provider.of<DrValueHolder>(context, listen: false);

    if (provider == null ||
        provider.psValueHolder.userIdToVerify == null ||
        provider.psValueHolder.userIdToVerify == '') {
      if (provider == null ||
          provider.psValueHolder == null ||
          provider.psValueHolder.loginUserId == null ||
          provider.psValueHolder.loginUserId == '') {
        final dynamic returnData = await Navigator.pushNamed(
          context,
          RoutePaths.home,
        );

        if (returnData != null && returnData is UserModel) {
          final UserModel user = returnData;
          provider.psValueHolder =
              Provider.of<DrValueHolder>(context, listen: false);
          provider.psValueHolder.loginUserId = user.id;
        }
      } else {
        onLoginSuccess();
      }
    } else {
      Navigator.pushNamed(context, RoutePaths.home,
          arguments: provider.psValueHolder.userIdToVerify);
    }
  }

  static String checkUserLoginId(DrValueHolder psValueHolder) {
    if (psValueHolder == null || psValueHolder.id == null || psValueHolder.id == '') {
      return '0';
    } else {
      return psValueHolder.id;
    }
  }

  // static String checkUserLoginId2(PsValueHolder psValueHolder) {
  //   if (psValueHolder.loginUserId == null) {
  //     return 'nologinuser';
  //   } else {
  //     return psValueHolder.loginUserId;
  //   }
  // }

  static Widget flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }

  static DrResource<List<T>> removeDuplicateObj<T>(
      DrResource<List<T>> resource) {
    final Map<String, String> _keyMap = HashMap<String, String>();
    final List<T> _tmpDataList = <T>[];

    if (resource != null && resource.data != null) {
      for (T obj in resource.data) {
        if (obj is DrObject) {
          final String _primaryKey = obj.getPrimaryKey();

          if (!_keyMap.containsKey(_primaryKey)) {
            _keyMap[_primaryKey] = _primaryKey;
            _tmpDataList.add(obj);
          }
        }
      }
    }
    resource.data = _tmpDataList;
    return resource;
  }

 static void fmcLoginConfigure(String tableName,String userID, Map<dynamic, dynamic> jsonMap) async {
   final QuerySnapshot result = await FirebaseFirestore.instance
       .collection(tableName)
       .where('id', isEqualTo: userID)
       .get();
   final List<DocumentSnapshot> documents = result.docs;

   if (documents.length == 0) {
     FirebaseFirestore.instance
         .collection(tableName)
         .doc(userID)
         .set(jsonMap);
   }
 }


  static Future<void> readFcmLocal(idSession,peerId) async {
    var groupChatId;
    if (idSession.hashCode <= peerId.hashCode) {
      groupChatId = '$idSession-$peerId';
    } else {
      groupChatId = '$peerId-$idSession';
    }
    FirebaseFirestore.instance
        .collection('users')
        .doc(idSession)
        .update({'chattingWith': peerId});
    return groupChatId;
  }


  static Future<void> sendFcmText(groupChatId,{sendFrom,sendTo,contentMessage}) async {
    var documentReference = FirebaseFirestore.instance
        .collection('messages')
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    FirebaseFirestore.instance.runTransaction((transaction) async {
       transaction.set(
        documentReference,
        {
          'idFrom': sendFrom,
          'idTo': sendTo,
          'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
          'content': contentMessage,
          'type': '1'
        },
      );
    });
  }

  static Future<String> findDistanceInEta(originLatitude, originLongitude, destinationLatitude, destinationLongitude) async {
    final String url =
        "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$originLatitude,$originLongitude&destinations=$destinationLatitude,$destinationLongitude&key=${DrConfig.apiKey}";
    try {
      var second2minutes, parseSecond2minutes,distanceInMeters;

      Uri uri = Uri.parse(url);
      final response = await http.get(uri);
      final responseDecoded = json.decode(response.body);
      distanceInMeters = (responseDecoded["rows"][0]["elements"][0]["duration"]['value']);
      final dateTime = DateTime.now();
      second2minutes = distanceInMeters / 60;
      parseSecond2minutes = dateTime.add(Duration(minutes: second2minutes.round()));
      final String totalTime = new DateFormat.jm().format(parseSecond2minutes);
      return totalTime;
    } catch (e) {
      return "Address can't be calculated";
    }
  }


 // static Future<String> saveDeviceToken() async {
 //   FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
 //   final String fcmToken = await _firebaseMessaging.getToken();
 //   print("Device Token: $fcmToken");
 //   return fcmToken;
 // }

  static List<LatLng> convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  static List decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    // repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negative then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    /*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  static Future<void> openMap(double destinationLatitude, double destinationLongitude, double userLatitude, double userLongitude) async {
    String googleUrl = 'https://www.google.com/maps/dir/?api=1&origin=$userLatitude,$userLongitude'
        '&destination=$destinationLatitude,$destinationLongitude&mode=d';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static String capitalize(String string) {
    if (string == null) {
      throw ArgumentError("string: $string");
    }
    if (string.isEmpty) {
      return string;
    }
    return string[0].toUpperCase() + string.substring(1);
  }

  static String capitalizeRemove(String string) {
    if (string == null) {
      throw ArgumentError("string: $string");
    }
    if (string.isEmpty) {
      return string;
    }
    String abc = string.replaceAll(new RegExp('[\\W_]+'),' ').toLowerCase();
    return abc[0].toUpperCase() + abc.substring(1);
  }

  static getConverter(params){
    if(params.toString().contains('km')){
      var paramOne =params.replaceAll("km", "");
      var paramTwo =paramOne.replaceAll(",", "");
      double x = double.parse(paramTwo);
      int c = x.round();
      return c.toString();
    }else{
      var paramOne =params.replaceAll("m", "");
      paramOne.replaceAll(",", "");
      double x = double.parse('1.0');
      int c = x.round();
      return c.toString();
    }

  }


  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }

  static double getBoundsZoomLevel(LatLngBounds bounds, Size mapDimensions) {
    var worldDimension = Size(1024, 1024);

    double latRad(lat) {
      var sinValue = sin(lat * pi / 180);
      var radX2 = log((1 + sinValue) / (1 - sinValue)) / 2;
      return max(min(radX2, pi), -pi) / 2;
    }

    double zoom(mapPx, worldPx, fraction) {
      return (log(mapPx / worldPx / fraction) / ln2).floorToDouble();
    }

    var ne = bounds.northeast;
    var sw = bounds.southwest;

    var latFraction = (latRad(ne.latitude) - latRad(sw.latitude)) / pi;

    var lngDiff = ne.longitude - sw.longitude;
    var lngFraction = ((lngDiff < 0) ? (lngDiff + 360) : lngDiff) / 360;

    var latZoom = zoom(mapDimensions.height, worldDimension.height, latFraction);
    var lngZoom = zoom(mapDimensions.width, worldDimension.width, lngFraction);

    if (latZoom < 0) return lngZoom;
    if (lngZoom < 0) return latZoom;

    return min(latZoom, lngZoom);
  }

  static LatLng getCentralLatLng(List<LatLng> geoCoordinates) {
    if (geoCoordinates.length == 1) {
      return geoCoordinates.first;
    }

    double x = 0;
    double y = 0;
    double z = 0;

    for (var geoCoordinate in geoCoordinates) {
      var latitude = geoCoordinate.latitude * pi / 180;
      var longitude = geoCoordinate.longitude * pi / 180;

      x += cos(latitude) * cos(longitude);
      y += cos(latitude) * sin(longitude);
      z += sin(latitude);
    }

    var total = geoCoordinates.length;

    x = x / total;
    y = y / total;
    z = z / total;

    var centralLongitude = atan2(y, x);
    var centralSquareRoot = sqrt(x * x + y * y);
    var centralLatitude = atan2(z, centralSquareRoot);

    return LatLng(centralLatitude * 180 / pi, centralLongitude * 180 / pi);
  }

  static LatLngBounds getCurrentBounds(LatLng position1, LatLng position2) {
    LatLngBounds bounds;

    try {
      bounds = LatLngBounds(
        northeast: position1,
        southwest: position2,
      );
    } catch (_) {
      bounds = LatLngBounds(
        northeast: position2,
        southwest: position1,
      );
    }

    return bounds;
  }

  static todayDate (){
    var now = new DateTime.now();
    return now;
  }

  static ratingsCal(String rating){
    if(int.parse(rating) > 10){
      return "10";
    }else{
      return rating;
    }
  }

  static Future<bool> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    try {
      return true;
    } catch (e) {
      return false;
    }
  }

  static textValidation(value){
    if(value == null || value == ''){
      return 'No Data';
    }else{
      return value;
    }
  }

}
