import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textStyle(
    BuildContext context, String title, int fontSize, Color color) {
  return widgetText(context, title, fontSize: fontSize, textColor: color);
}

// setStyleContent(BuildContext context, Color color, double fontSize, FontWeight weight,
//     {double letterSpacing = 0.1,bool isJustify = false}){
//   return TextStyle(
//     color: color,
//     fontSize: fontSize,
//     fontWeight: weight,
//     letterSpacing: letterSpacing,
//   );
// }

setStyleContent(BuildContext context, Color color, double fontSize, FontWeight weight,
    {double letterSpacing = 0.1,bool isJustify = false}){
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: weight,
      letterSpacing: letterSpacing,
    ),
  );
}

Widget widgetText(context, var text,{var fontSize,textColor,
    var fontFamily = "OpenSans",
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.1,
    var isLongText = false,
    var isJustify = false,
    var aDecoration}) {
  return Text(
    text,
    textAlign: isCentered
        ? TextAlign.center
        : isJustify
            ? TextAlign.justify
            : TextAlign.start,
    maxLines: isLongText ? 20 : maxLine,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: textColor,
        fontSize: double.parse(fontSize.toString()).toDouble(),
        letterSpacing: latterSpacing,
      ),
    ),
  );
}

//Text 9 white Color

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

final ThemeData base = ThemeData.light();

int getColorHexFromStr(String colorStr) {
  colorStr = "FF" + colorStr;
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("An error occurred when converting a color");
    }
  }
  return val;
}
