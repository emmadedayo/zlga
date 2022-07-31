import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/config/size_config.dart';
import 'package:zlga/acadaar_ctrl/config/style.dart';
import 'package:zlga/factory/provider/userProvider/user_provider.dart';
import 'package:zlga/factory/reprository/user_reprository.dart';
import 'package:zlga/screen/widget/app_button.dart';
import 'package:zlga/screen/widget/inputWidget.dart';
import 'package:zlga/screen/widget/widgetMenu.dart';


class EditScreenIndex extends StatefulWidget {
  const EditScreenIndex({
    Key key,
    this.onProfileSelected,
  }) : super(key: key);
  final Function onProfileSelected;

  @override
  _EditScreenIndexState createState() => _EditScreenIndexState();
}

class _EditScreenIndexState extends State<EditScreenIndex> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController oldPassword = new TextEditingController();
  final TextEditingController changePassword = new TextEditingController();
  final TextEditingController confirmPassword = new TextEditingController();

  bool passwordVisible;
  bool remember = false;
  UserRepository userRepo;
  UserProvider userProvider;
  DrValueHolder psValueHolder;

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    userRepo = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      iosContentBottomPadding: true,
      iosContentPadding: true,
      backgroundColor: PsColors.mainColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "assets/images/washing_machine_illustration.png",
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 15.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                LineIcons.arrowLeft,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Settings",
                              style: setStyleContent(
                                  context, Colors.white, 25, FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            minHeight:
                            MediaQuery.of(context).size.height - 180.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: SizeConfig.screenHeight * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                    child: Text('Notification',style: setStyleContent(context,PsColors.black,13,FontWeight.normal)),
                                  ),
                                  PlatformSwitch(
                                      onChanged: (bool value) async {
                                        setState(() {
                                         // pshHotDealsRecommendation = value;
                                        });
                                      },
                                      value: true,
                                      material: (_, __)  => MaterialSwitchData(
                                        activeColor: PsColors.mainColor,
                                        inactiveThumbColor: PsColors.grey,
                                      ),
                                      cupertino: (_, __) => CupertinoSwitchData(
                                        activeColor: PsColors.mainColor,
                                      )
                                  )
                                ],
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                    child: Text('Location',style: setStyleContent(context,PsColors.black,13,FontWeight.normal)),
                                  ),
                                  PlatformSwitch(
                                      onChanged: (bool value) async {
                                        setState(() {
                                          // pshHotDealsRecommendation = value;
                                        });
                                      },
                                      value: true,
                                      material: (_, __)  => MaterialSwitchData(
                                        activeColor: PsColors.mainColor,
                                        inactiveThumbColor: PsColors.grey,
                                      ),
                                      cupertino: (_, __) => CupertinoSwitchData(
                                        activeColor: PsColors.mainColor,
                                      )
                                  )
                                ],
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                    child: Text('Privacy(make all complaints anonymous)',style: setStyleContent(context,PsColors.black,13,FontWeight.normal)),
                                  ),
                                  PlatformSwitch(
                                      onChanged: (bool value) async {
                                        setState(() {
                                          // pshHotDealsRecommendation = value;
                                        });
                                      },
                                      value: true,
                                      material: (_, __)  => MaterialSwitchData(
                                        activeColor: PsColors.mainColor,
                                        inactiveThumbColor: PsColors.grey,
                                      ),
                                      cupertino: (_, __) => CupertinoSwitchData(
                                        activeColor: PsColors.mainColor,
                                      )
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Divider(),
                              MenuWidget(
                                title: 'Reset Password',
                                subtitle: 'Change your password',
                                onTap: (){
                                  showModalBottomSheet(
                                    enableDrag: true,
                                    isDismissible: false,
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),)),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SingleChildScrollView(
                                        child: Padding(
                                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                            child: Container(
                                              margin: EdgeInsets.only(top: 6,left: 5,right: 5),
                                              padding: EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: Text('Change Your Password',
                                                        style: setStyleContent(context, Color(0xff08133D), 15, FontWeight.w400)),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  PlatformTextField(
                                                      material: (_, __)  => MaterialTextFieldData(
                                                        cursorColor: Color.fromRGBO(0, 0, 0, 0.3),
                                                        autofocus: true,
                                                        style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 14, FontWeight.normal),
                                                        decoration: InputDecoration(labelStyle: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.3), 13, FontWeight.normal),
                                                          labelText: 'Old Password',
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                                                          ),
                                                          border: UnderlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
                                                          focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
                                                        ),
                                                        controller: oldPassword,
                                                        keyboardType: TextInputType.text,
                                                      ),
                                                      cupertino: (_, __) => CupertinoTextFieldData(
                                                        placeholder: 'Old Password',
                                                        clearButtonMode: OverlayVisibilityMode.editing,
                                                        keyboardType: TextInputType.text,
                                                        autocorrect: false,
                                                        controller: oldPassword,
                                                        placeholderStyle: setStyleContent(context, Colors.grey, 16, FontWeight.normal),
                                                        style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 11, FontWeight.normal),
                                                        decoration: BoxDecoration(
                                                          border: Border(bottom: BorderSide(
                                                            width: 0,
                                                            color: CupertinoColors.inactiveGray,),
                                                          ),),
                                                      )
                                                    //controller: textControlller,
                                                  ),
                                                  SizedBox(height: 10,),
                                                  PlatformTextField(
                                                      material: (_, __)  => MaterialTextFieldData(
                                                        cursorColor: Color.fromRGBO(0, 0, 0, 0.3),
                                                        autofocus: true,
                                                        style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 14, FontWeight.normal),
                                                        decoration: InputDecoration(labelStyle: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.3), 13, FontWeight.normal),
                                                          labelText: 'New Password',
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                                                          ),
                                                          border: UnderlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
                                                          focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
                                                        ),
                                                        controller: changePassword,
                                                        keyboardType: TextInputType.text,
                                                      ),
                                                      cupertino: (_, __) => CupertinoTextFieldData(
                                                        placeholder: 'New Password',
                                                        clearButtonMode: OverlayVisibilityMode.editing,
                                                        keyboardType: TextInputType.text,
                                                        autocorrect: false,
                                                        controller: changePassword,
                                                        placeholderStyle: setStyleContent(context, Colors.grey, 16, FontWeight.normal),
                                                        style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 11, FontWeight.normal),
                                                        decoration: BoxDecoration(
                                                          border: Border(bottom: BorderSide(
                                                            width: 0,
                                                            color: CupertinoColors.inactiveGray,),
                                                          ),),
                                                      )
                                                    //controller: textControlller,
                                                  ),
                                                  SizedBox(height: 10,),
                                                  PlatformTextField(
                                                      material: (_, __)  => MaterialTextFieldData(
                                                        cursorColor: Color.fromRGBO(0, 0, 0, 0.3),
                                                        autofocus: true,
                                                        style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 14, FontWeight.normal),
                                                        decoration: InputDecoration(labelStyle: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.3), 13, FontWeight.normal),
                                                          labelText: 'Confirm New Password',
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                                                          ),
                                                          border: UnderlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
                                                          focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
                                                        ),
                                                        controller: confirmPassword,
                                                        keyboardType: TextInputType.text,
                                                      ),
                                                      cupertino: (_, __) => CupertinoTextFieldData(
                                                        placeholder: 'Confirm New Password',
                                                        clearButtonMode: OverlayVisibilityMode.editing,
                                                        keyboardType: TextInputType.text,
                                                        autocorrect: false,
                                                        controller: confirmPassword,
                                                        placeholderStyle: setStyleContent(context, Colors.grey, 16, FontWeight.normal),
                                                        style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 11, FontWeight.normal),
                                                        decoration: BoxDecoration(
                                                          border: Border(bottom: BorderSide(
                                                            width: 0,
                                                            color: CupertinoColors.inactiveGray,),
                                                          ),),
                                                      )
                                                    //controller: textControlller,
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      ButtonTheme(
                                                        minWidth: 130.0,
                                                        height: 45.0,
                                                        child: PlatformButton(
                                                            onPressed: () async {


                                                            },
                                                            child: Text('Update',style: setStyleContent(context,PsColors.white,14,FontWeight.normal),),
                                                            material: (_, __)  => MaterialRaisedButtonData(
                                                                elevation: 0.0,
                                                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                                                                color: PsColors.mainColor,
                                                                textColor: PsColors.white
                                                            ),
                                                            cupertino: (_, __) => CupertinoButtonData(
                                                              color: PsColors.mainColor,
                                                            )
                                                        ),
                                                      ),
                                                      ButtonTheme(
                                                        minWidth: 130.0,
                                                        height: 45.0,
                                                        child: PlatformButton(
                                                            onPressed: (){
                                                              changePassword.clear();
                                                              confirmPassword.clear();
                                                              oldPassword.clear();
                                                              Navigator.pop(context);
                                                            },
                                                            child: Text('Cancel',style: setStyleContent(context,PsColors.white,14,FontWeight.normal),),
                                                            material: (_, __)  => MaterialRaisedButtonData(
                                                                elevation: 0.0,
                                                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                                                                color: PsColors.black,
                                                                textColor: PsColors.white
                                                            ),
                                                            cupertino: (_, __) => CupertinoButtonData(
                                                              color: PsColors.mainColor,
                                                            )
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                        ),
                                      );
                                    },
                                  );
                                }
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
