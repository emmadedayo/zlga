import 'package:zlga/acadaar_ctrl/common/dr_provider.dart';
import 'package:zlga/acadaar_ctrl/config/ps_theme_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PsThemeProvider extends DrProvider {
  PsThemeProvider({@required PsThemeRepository repo, int limit = 0})
      : super(repo, limit) {
    _repo = repo;
  }

  PsThemeRepository _repo;

  Future<dynamic> updateTheme(bool isDarkTheme) {
    return _repo.updateTheme(isDarkTheme);
  }

  ThemeData getTheme() {
    return _repo.getTheme();
  }
}
