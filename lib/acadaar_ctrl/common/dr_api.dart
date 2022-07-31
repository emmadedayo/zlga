import 'dart:convert';
import 'dart:io';
import 'package:zlga/acadaar_ctrl/ObjectHolder/ps_object.dart';
import 'package:zlga/acadaar_ctrl/common/dr_api_reponse.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/acadaar_ctrl/config/dr_config.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

abstract class DrApi {
  DrResource<T> DrObjectConvert<T>(dynamic dataList, T data) {
    return DrResource<T>(dataList.status, dataList.message, data);
  }


  Future<DrResource<R>> nonAuthGet<T extends DrObject<dynamic>, R>(
      T obj, String url) async {
    final Client client = http.Client();
    try {
      final Response response = await client.get(Uri.parse(url));
      final DrApiResponse drApiResponse = DrApiResponse(response);
      if (drApiResponse.isSuccessful()) {
        final dynamic hashMap = json.decode(response.body);
        var result = hashMap['data'];
        print('responses' + result.toString());
        if (!(result is Map)) {
          final List<T> tList = <T>[];
          result.forEach((dynamic data) {
            tList.add(obj.fromMap(data as dynamic));
          });
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, tList ?? R);
        } else {
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, obj.fromMap(result));
        }
      } else {
        return DrResource<R>(DrStatus.ERROR, drApiResponse.errorMessage, null);
      }
    } finally {
      client.close();
    }
  }

  Future<DrResource<R>> getServerRequest<T extends DrObject<dynamic>, R>(
      T obj, String url, String param) async {
    final Client client = http.Client();
    try {
     // Map<String, String> headers = {'Authorization': 'Bearer ' + apiSession};
      var uri = Uri.parse(url).replace(query:param);
      final Response response = await client.get(uri);
      final DrApiResponse drApiResponse = DrApiResponse(response);
      if (drApiResponse.isSuccessful()) {
        final dynamic hashMap = json.decode(response.body);
        var result = hashMap['data'];
        if (!(result is Map)) {
          final List<T> tList = <T>[];
          result.forEach((dynamic data) {
            tList.add(obj.fromMap(data as dynamic));
          });
          return DrResource<R>(DrStatus.SUCCESS, '', tList ?? R);
        } else {
          return DrResource<R>(DrStatus.SUCCESS, '', obj.fromMap(result));
        }
      } else {
        return DrResource<R>(DrStatus.ERROR, 'Error loading from host', null);
      }
    } finally {
      client.close();
    }
  }

  Future<DrResource<R>> getSessionParams<T extends DrObject<dynamic>, R>(
      T obj, String url, String apiSession, String param) async {
    final Client client = http.Client();
    try {
      Map<String, String> headers = {'Authorization': 'Bearer ' + apiSession};
      var uri = Uri.parse(url).replace(query:param);
      print('uriuri ${uri}');
      final Response response = await client.get(uri,headers: headers);
      final DrApiResponse drApiResponse = DrApiResponse(response);
      if (drApiResponse.isSuccessful()) {
        final dynamic hashMap = json.decode(response.body);
        var result = hashMap['data'];
        print('responses' + result.toString());
        if (!(result is Map)) {
          final List<T> tList = <T>[];
          result.forEach((dynamic data) {
            tList.add(obj.fromMap(data as dynamic));
          });
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, tList ?? R);
        } else {
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, obj.fromMap(result));
        }
      } else {
        return DrResource<R>(DrStatus.ERROR, drApiResponse.errorMessage, null);
      }
    } finally {
      client.close();
    }
  }



  Future<DrResource<R>> getServerSessionCall<T extends DrObject<dynamic>, R>(
      T obj, String url, String apiSession) async {
    final Client client = http.Client();
    try {
      Map<String, String> headers = {'Authorization': 'Bearer ' + apiSession};
      print('responses' + apiSession.toString());
      final Response response = await client.get(Uri.parse(url),headers: headers);
      final DrApiResponse drApiResponse = DrApiResponse(response);
      if (drApiResponse.isSuccessful()) {
        final dynamic hashMap = json.decode(response.body);
        var result = hashMap['data'];

        if (!(result is Map)) {
          final List<T> tList = <T>[];
          result.forEach((dynamic data) {
            tList.add(obj.fromMap(data as dynamic));
          });
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, tList ?? R);
        } else {
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, obj.fromMap(result));
        }
      } else {
        return DrResource<R>(DrStatus.ERROR, drApiResponse.errorMessage, null);
      }
    } finally {
      client.close();
    }
  }


  Future<DrResource<R>> postSessionData<T extends DrObject<dynamic>, R>(T obj,
      String url, String apiSession, Map<dynamic, dynamic> jsonMap) async {
    final Client client = http.Client();
    try {
      final Response response = await client
          .post(Uri.parse('$url'),
              headers: <String, String>{
                'Authorization': 'Bearer ' + apiSession,
                'content-type': 'application/json'
              },
              body: const JsonEncoder().convert(jsonMap))
          .catchError((dynamic e) {
        print('** Error Post Data');
        print(e.message);
      });

      print('jsonMap  ${JsonEncoder().convert(jsonMap)}');

      final DrApiResponse drApiResponse = DrApiResponse(response);
      if (drApiResponse.isSuccessful()) {
        final dynamic hashMap = json.decode(response.body);
        var result = hashMap['data'];
        print("rest" + result.toString());
        if (!(result is Map)) {
          final List<T> tList = <T>[];
          result.forEach((dynamic data) {
            tList.add(obj.fromMap(data));
          });
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, tList ?? R);
        } else {
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, obj.fromMap(result));
        }
      } else {
        return DrResource<R>(DrStatus.ERROR, drApiResponse.errorMessage, null);
      }
    } finally {
      client.close();
    }
  }

  Future<DrResource<R>> postData<T extends DrObject<dynamic>, R>(
      T obj, String url, Map<dynamic, dynamic> jsonMap) async {
    final Client client = http.Client();

    print('dddd'+jsonMap.toString());
    try {
      final Response response = await client
          .post(Uri.parse('$url'),
          headers: <String, String>{
            'content-type': 'application/json'
          },
          body: const JsonEncoder().convert(jsonMap))
          .catchError((dynamic e) {
        print('${e.toString()}');
        // print(e.message);
      });

      final DrApiResponse drApiResponse = DrApiResponse(response);

      if (drApiResponse.isSuccessful()) {
        final dynamic hashMap = json.decode(response.body);
        var result = hashMap['data'];
        print("rest" + result.toString());
        if (!(result is Map)) {
          final List<T> tList = <T>[];
          result.forEach((dynamic data) {
            tList.add(obj.fromMap(data));
          });
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, tList ?? R);
        } else {
          return DrResource<R>(DrStatus.SUCCESS, '', obj.fromMap(result));
        }
      } else {
        return DrResource<R>(DrStatus.ERROR, drApiResponse.errorMessage, null);
      }
    } finally {
      client.close();
    }
  }

  Future<DrResource<R>> postProductUploadImage<T extends DrObject<dynamic>, R>(T obj,
      String url, String sessionApi, Map<dynamic, dynamic> jsonMap, File imageFile) async {
    final Client client = http.Client();
    try {
      final ByteStream stream =
          http.ByteStream(Stream.castFrom(imageFile.openRead()));
      final int length = await imageFile.length();

      final Uri uri = Uri.parse('$url');
      Map<String, String> headers = {'Authorization': 'Bearer ' + sessionApi};
      final MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);

      final MultipartFile multipartFile = http.MultipartFile('product_image', stream, length,filename: basename(imageFile.path));
      request.fields['product_name'] = jsonMap['product_name'];
      request.fields['available_item'] = jsonMap['available_item'];
      request.fields['product_description'] = jsonMap['product_description'];
      request.fields['product_price'] = jsonMap['product_price'];
      request.fields['category'] = jsonMap['category'];
      request.fields['sub_category'] = jsonMap['sub_category'];
      request.files.add(multipartFile);
      final StreamedResponse response = await request.send();
      // print("fileimage ${response.stream}");
      final DrApiResponse drApiResponse =
          DrApiResponse(await http.Response.fromStream(response));

      if (drApiResponse.isSuccessful()) {
        final dynamic hashMap = json.decode(drApiResponse.body);
        var result = hashMap['data'];
        if (!(result is Map)) {
          final List<T> tList = <T>[];
          result.forEach((dynamic data) {
            tList.add(obj.fromMap(data));
          });
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, tList ?? R);
        } else {
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, obj.fromMap(result));
        }
      } else {
        //  print("fileimage ${json.decode(drApiResponse.body)}");
        return DrResource<R>(DrStatus.ERROR, drApiResponse.errorMessage, null);
      }
    } finally {
      client.close();
    }
  }


  Future<DrResource<R>> postUploadImage<T extends DrObject<dynamic>, R>(T obj,
      String url, String sessionApi, Map<dynamic, dynamic> jsonMap, File imageFile) async {
    final Client client = http.Client();
    try {
      final ByteStream stream =
      http.ByteStream(Stream.castFrom(imageFile.openRead()));
      final int length = await imageFile.length();

      final Uri uri = Uri.parse('$url');
      Map<String, String> headers = {'Authorization': 'Bearer ' + sessionApi};
      final MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      final MultipartFile multipartFile = http.MultipartFile('image', stream, length,filename: basename(imageFile.path));
      request.fields['document_type'] = jsonMap['document_type'];

      request.files.add(multipartFile);
      final StreamedResponse response = await request.send();

      final DrApiResponse drApiResponse =
      DrApiResponse(await http.Response.fromStream(response));

      if (drApiResponse.isSuccessful()) {
        final dynamic hashMap = json.decode(drApiResponse.body);
        var result = hashMap['data'];
        if (!(result is Map)) {
          final List<T> tList = <T>[];
          result.forEach((dynamic data) {
            tList.add(obj.fromMap(data));
          });
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, tList ?? R);
        } else {
          return DrResource<R>(DrStatus.SUCCESS, drApiResponse.successMessage, obj.fromMap(result));
        }
      } else {
        //  print("fileimage ${json.decode(drApiResponse.body)}");
        return DrResource<R>(DrStatus.ERROR, drApiResponse.errorMessage, null);
      }
    } finally {
      client.close();
    }
  }

  Future<DrResource<R>> postUploadImageSingle<T extends DrObject<dynamic>, R>(T obj,
      String url, String sessionApi, String userId, File imageFile) async {
    final Client client = http.Client();
    try {
      final ByteStream stream =
      http.ByteStream(Stream.castFrom(imageFile.openRead()));
      final int length = await imageFile.length();

      final Uri uri = Uri.parse('$url');
      Map<String, String> headers = {'Authorization': 'Bearer ' + sessionApi};
      final MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      final MultipartFile multipartFile = http.MultipartFile('image', stream, length,filename: basename(imageFile.path));
      request.fields['userID'] = userId;
      request.files.add(multipartFile);
      final StreamedResponse response = await request.send();

      final DrApiResponse drApiResponse =
      DrApiResponse(await http.Response.fromStream(response));


      if (drApiResponse.isSuccessful()) {
        final dynamic hashMap = json.decode(drApiResponse.body);

        if (!(hashMap is Map)) {
          final List<T> tList = <T>[];
          hashMap.forEach((dynamic data) {
            tList.add(obj.fromMap(data));
          });
          return DrResource<R>(DrStatus.SUCCESS, '', tList ?? R);
        } else {
          return DrResource<R>(DrStatus.SUCCESS, '', obj.fromMap(hashMap));
        }
      } else {
          print("fileimage ${json.decode(drApiResponse.body)}");
        return DrResource<R>(DrStatus.ERROR, drApiResponse.errorMessage, null);
      }
    } finally {
      client.close();
    }
  }
}
