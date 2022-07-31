import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/config/style.dart';


class InputWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final double height;
  final String topLabel;
  final bool obscureText;
  final TextEditingController textEditingController;

  InputWidget({
    this.hintText,
    this.prefixIcon,
    this.textEditingController,
    this.height = 48.0,
    this.topLabel = "",
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(this.topLabel,style: setStyleContent(context, PsColors.black, 15, FontWeight.normal),),
        SizedBox(height: 10.0),
        Container(
          height: ScreenUtil().setHeight(height),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1.0),
          ),
          child: TextFormField(
            obscureText: this.obscureText,
            controller: textEditingController,
            style: setStyleContent(context, PsColors.black, 15, FontWeight.normal),
            decoration: InputDecoration(
              prefixIcon: this.prefixIcon == null
                  ? this.prefixIcon
                  : Icon(
                this.prefixIcon,
                color: Color.fromRGBO(105, 108, 121, 1),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: PsColors.mainColor, width: 1.0),
              ),
              labelText: this.hintText,
              labelStyle: setStyleContent(context, PsColors.black, 15, FontWeight.normal),
              hintText: this.hintText,
              hintStyle: setStyleContent(context, PsColors.black, 15, FontWeight.normal),
            ),
          ),
        )
      ],
    );
  }
}