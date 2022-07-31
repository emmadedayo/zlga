import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io' show Platform;

import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';


void showErrorAndroid(context, errorMessage) {
  showModalBottomSheet(context: context, isDismissible: false,  builder: (BuildContext bc) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Wrap(
        spacing: 60,
        children: <Widget>[
          Container(height: 10),
          Text("Error Message", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
          Container(height: 10),
          Container(
            child: Text(errorMessage,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18
              ),
            ),
          ),
          Container(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new FlatButton(
                textColor:  PsColors.mainColorWithBlack,
                color: Colors.transparent,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: new Text("Contact Support"),
              ),
              new RaisedButton(
                textColor: Colors.white,
                color: PsColors.redColor,
                onPressed: (){},
                child: new Text("Exit"),
              )
            ],
          )
        ],
      ),
    );
  });
}

void showErrorIos(context, errorMessage) {
  showCupertinoModalPopup(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: const Text('Error Message'),
      message: Text(errorMessage,
        style: TextStyle(
            color: Colors.grey[600],
            fontSize: 18
        ),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Contact Support'),
          onPressed: () {
            Navigator.pop(context, 'One');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Exit'),
          onPressed: () {
            Navigator.pop(context, 'Two');
          },
        )
      ],
    ),
  );
}

void showVersionAndroid(context, errorMessage) {
  showModalBottomSheet(context: context, isDismissible: false,  builder: (BuildContext bc) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Wrap(
        spacing: 60,
        children: <Widget>[
          Container(height: 10),
          Text("Error Message",
            style: GoogleFonts.montserrat(
            textStyle: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
          ),
          Container(height: 10),
          Container(
            child: Text(errorMessage,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
          Container(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new FlatButton(
                textColor:  PsColors.mainColorWithBlack,
                color: Colors.transparent,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: new Text("Contact Support"),
              ),
              new RaisedButton(
                textColor: Colors.white,
                color: PsColors.redColor,
                onPressed: (){},
                child: new Text("Exit"),
              )
            ],
          )
        ],
      ),
    );
  });
}

void showVersionIos(context, errorMessage) {
  showCupertinoModalPopup(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: const Text('Error Message'),
      message: Text(errorMessage,
        style: TextStyle(
            color: Colors.grey[600],
            fontSize: 18
        ),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Contact Support'),
          onPressed: () {
            Navigator.pop(context, 'One');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Exit'),
          onPressed: () {
            Navigator.pop(context, 'Two');
          },
        )
      ],
    ),
  );
}