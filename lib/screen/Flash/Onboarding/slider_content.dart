import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderContent extends StatelessWidget {
  const SliderContent({
    Key key,
    @required this.image,
    @required this.title,
    @required this.text,
  }) : super(key: key);

  final String image, title, text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Spacer(),

        Image.asset(
          image,
          height: (270 / 896) * size.height, // 896 is width that designer used, 270 is height of the image that designer used
        ),

        Spacer(),

        Text(
          title,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
                fontSize: 18,
                color: Color(0xFF158f08),
                fontWeight: FontWeight.bold
            ),
          ),
        ),

        SizedBox(height: 20.0 / 2),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0 * 2),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  fontSize: 13,
                  color: Color(0XFF374457),
                  fontWeight: FontWeight.normal
              ),
            ),
          ),
        )
      ],
    );
  }
}