import 'package:flutter/cupertino.dart';
import 'package:zlga/acadaar_ctrl/ObjectHolder/ps_holder.dart';

class ParamsHolder extends DrHolder<ParamsHolder> {
  ParamsHolder(
      {
        this.paramOne,
        this.paramTwo,
        this.paramThree,
        this.paramFour,
        this.paramFive,
        this.paramSix,
        this.paramSeven,
        this.paramEight,
        this.paramNine,
        this.paramTen,
        this.paramEleven,
        this.paramTwelve,
        this.paramThirteen,
        this.paramFourteen,
        this.paramFifteen,
        this.paramSixteen,
        this.paramSeventeen,
        this.paramEighteen,
        this.paramNineteen,
        this.paramTwenty,
      });

  final String paramOne;
  final String paramTwo;
  final String paramThree;
  final String paramFour;
  final String paramFive;
  final String paramSix;
  final String paramSeven;
  final String paramEight;
  final String paramNine;
  final String paramTen;
  final String paramEleven;
  final String paramTwelve;
  final String paramThirteen;
  final String paramFourteen;
  final String paramFifteen;
  final String paramSixteen;
  final String paramSeventeen;
  final String paramEighteen;
  final String paramNineteen;
  final String paramTwenty;


  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['paramOne'] = paramOne;
    map['paramTwo'] = paramTwo;
    map['paramThree'] = paramThree;
    map['paramFour'] = paramFour;
    map['paramFive'] = paramFive;
    map['paramSix'] = paramSix;
    map['paramSeven'] = paramSeven;
    map['paramEight'] = paramEight;
    map['paramNine'] = paramNine;
    map['paramTen'] = paramTen;
    map['paramEleven'] = paramEleven;
    map['paramTwelve'] = paramTwelve;
    map['paramThirteen'] = paramThirteen;
    map['paramFourteen'] = paramFourteen;
    map['paramFifteen'] = paramFifteen;
    map['paramSixteen'] = paramSixteen;
    map['paramSeventeen'] = paramSeventeen;
    map['paramEighteen'] = paramEighteen;
    map['paramNineteen'] = paramNineteen;
    map['paramTwenty'] = paramTwenty;
    return map;
  }

  @override
  ParamsHolder fromMap(dynamic dynamicData) {
    return ParamsHolder(
      paramOne: dynamicData['paramOne'],
      paramTwo: dynamicData['paramTwo'],
      paramThree: dynamicData['paramThree'],
      paramFour: dynamicData['paramFour'],
      paramFive: dynamicData['paramFive'],
      paramSix: dynamicData['paramSix'],
      paramSeven: dynamicData['paramSeven'],
      paramEight: dynamicData['paramEight'],

      paramNine: dynamicData['paramNine'],
      paramTen: dynamicData['paramTen'],
      paramEleven: dynamicData['paramEleven'],
      paramTwelve: dynamicData['paramTwelve'],
      paramThirteen: dynamicData['paramThirteen'],
      paramFourteen: dynamicData['paramFourteen'],
      paramFifteen: dynamicData['paramFifteen'],
      paramSixteen: dynamicData['paramSixteen'],
      paramSeventeen: dynamicData['paramSeventeen'],
      paramEighteen: dynamicData['paramEighteen'],
      paramNineteen: dynamicData['paramNineteen'],
      paramTwenty: dynamicData['paramTwenty'],

    );
  }

  @override
  String getParamKey() {
    String key = '';
    if (paramOne != '') {
      key += paramOne;
    }
    return key;
  }
}
