// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

class PersonalIcons {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  PersonalIcons._();

  /// The icon font used for Cupertino icons.
  static const String iconFont = 'CupertinoIcons';

  /// The dependent package providing the Cupertino icons font.
  static const String iconFontPackage = 'cupertino_icons';

  static const IconData personalCancel = IconData(0xe0c9, fontFamily: iconFont, fontPackage: iconFontPackage);

  static const IconData editIcon = IconData(0xe6e5, fontFamily: iconFont, fontPackage: iconFontPackage);

}
