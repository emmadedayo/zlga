import 'package:quiver/core.dart';
import 'package:zlga/acadaar_ctrl/ObjectHolder/ps_object.dart';


class InformationModel extends DrObject<InformationModel> {
  InformationModel({
    this.id,
    this.newsTitle,
    this.newsData,
    this.newsImage,
    this.newsInfo,
  });

  String id;
  String newsTitle;
  String newsData;
  String newsImage;
  String newsInfo;

  @override
  bool operator ==(dynamic other) => other is InformationModel && id == other.id;

  @override
  int get hashCode {
    return hash2(id.hashCode, id.hashCode);
  }

  @override
  String getPrimaryKey() {
    return id;
  }

  @override
  InformationModel fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return InformationModel(
        id: dynamicData['id'],
        newsTitle: dynamicData['news_title'],
        newsData: dynamicData['news_date'],
        newsImage: dynamicData['news_image'],
        newsInfo: dynamicData['news_info'],
      );
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic> toMap(InformationModel object) {
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = object.id;
      data['news_title'] = object.newsTitle;
      data['news_date'] = object.newsData;
      data['news_image'] = object.newsImage;
      data['news_info'] = object.newsInfo;
      return data;
    } else {
      return null;
    }
  }

  @override
  List<InformationModel> fromMapList(List<dynamic> dynamicDataList) {
    final List<InformationModel> subBankModelList = <InformationModel>[];

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
  List<Map<String, dynamic>> toMapList(List<InformationModel> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (InformationModel data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}
