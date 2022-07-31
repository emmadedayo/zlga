import 'package:zlga/acadaar_ctrl/Db/common/EmmadedayoDB.dart';
import 'package:zlga/acadaar_ctrl/Db/common/dr_repository.dart';
import 'package:zlga/acadaar_ctrl/config/ps_theme_data.dart';
import 'package:zlga/acadaar_ctrl/constant/dr_constants.dart';
import 'package:flutter/material.dart';

class PsThemeRepository extends DrRepository {
  PsThemeRepository({@required EmmaSharedPreferences psSharedPreferences}) {
    _psSharedPreferences = psSharedPreferences;
  }

  EmmaSharedPreferences _psSharedPreferences;

  Future<void> updateTheme(bool isDarkTheme) async {
    await _psSharedPreferences.shared
        .setBool(DrConst.THEME__IS_DARK_THEME, isDarkTheme);
  }

  ThemeData getTheme() {
    final bool isDarkTheme =
        _psSharedPreferences.shared.getBool(DrConst.THEME__IS_DARK_THEME) ??
            false;

    if (isDarkTheme) {
      return themeData(ThemeData.dark());
    } else {
      return themeData(ThemeData.light());
    }
  }
}
