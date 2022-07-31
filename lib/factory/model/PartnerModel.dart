import 'package:quiver/core.dart';
import 'package:zlga/acadaar_ctrl/ObjectHolder/ps_object.dart';


class PartnerModel extends DrObject<PartnerModel> {
  PartnerModel({
    this.id,
    this.productPartnerImage,
    this.partnerLink,
  });

  String id;
  String productPartnerImage;
  String partnerLink;

  @override
  bool operator ==(dynamic other) => other is PartnerModel && id == other.id;

  @override
  int get hashCode {
    return hash2(id.hashCode, id.hashCode);
  }

  @override
  String getPrimaryKey() {
    return id;
  }

  @override
  PartnerModel fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return PartnerModel(
        id: dynamicData['id'],
        productPartnerImage: dynamicData['product_partner_image'],
        partnerLink: dynamicData['partner_link'],
      );
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic> toMap(PartnerModel object) {
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = object.id;
      data['product_partner_image'] = object.productPartnerImage;
      data['partner_link'] = object.partnerLink;
      return data;
    } else {
      return null;
    }
  }

  @override
  List<PartnerModel> fromMapList(List<dynamic> dynamicDataList) {
    final List<PartnerModel> subBankModelList = <PartnerModel>[];

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
  List<Map<String, dynamic>> toMapList(List<PartnerModel> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (PartnerModel data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}
