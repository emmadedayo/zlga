import 'package:quiver/core.dart';
import 'package:zlga/acadaar_ctrl/ObjectHolder/ps_object.dart';


class AdvertModel extends DrObject<AdvertModel> {
  AdvertModel({
    this.id,
    this.advertType,
    this.advertImage,
  });

  String id;
  String advertType;
  String advertImage;

  @override
  bool operator ==(dynamic other) => other is AdvertModel && id == other.id;

  @override
  int get hashCode {
    return hash2(id.hashCode, id.hashCode);
  }

  @override
  String getPrimaryKey() {
    return id;
  }

  @override
  AdvertModel fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return AdvertModel(
        id: dynamicData['id'] as String,
        advertType: dynamicData['advert_type'],
        advertImage: dynamicData['advert_image'],
      );
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic> toMap(AdvertModel object) {
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = object.id;
      data['advert_type'] = object.advertType;
      data['advert_image'] = object.advertImage;
      return data;
    } else {
      return null;
    }
  }

  @override
  List<AdvertModel> fromMapList(List<dynamic> dynamicDataList) {
    final List<AdvertModel> subBankModelList = <AdvertModel>[];

    if (dynamicDataList != null) {
      for (dynamic dynamicData in dynamicDataList) {
        if (dynamicData != null) {
          subBankModelList.add(fromMap(dynamicData));
        }
      }
    }
    return subBankModelList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<AdvertModel> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (AdvertModel data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}
