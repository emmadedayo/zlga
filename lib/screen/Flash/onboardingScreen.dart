import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zlga/screen/Flash/Onboarding/main_button.dart';
import 'package:zlga/screen/Flash/Onboarding/skip_button.dart';
import 'package:zlga/screen/Flash/Onboarding/slider_content.dart';

class OnBoardingScreen extends StatefulWidget {
  final SharedPreferences prefs;
  OnBoardingScreen({this.prefs});
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnBoardingScreen> {
  int selectedSlider = 0;
  // Slider Dataf
  List<Map<String, String>> sliders = [
    {
      "title": "Think Green, Think Clean, Think Ondo",
      "text": "The Ondo State Government, Ministry of Environment needs you to ensure a green Ondo",
      "image": "assets/images/slideOne.png"
    },
    {
      "title": "See it now, Report it now",
      "text": "Help fellow citizen stay safe by reporting infractions around you in seconds",
      "image": "assets/images/slideOne.png"
    },
    {
      "title": "Together let's build a Greater Ondo",
      "text": "Track and see latest update about your infractions",
      "image": "assets/images/slideOne.png"
    },
  ];

  PageController sliderController = PageController(initialPage: 0, keepPage: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        selectedSlider = index;
                      });
                    },
                    controller: sliderController,
                    itemCount: sliders.length,
                    itemBuilder: (context, index) => SliderContent(
                      image: sliders[index]['image'],
                      title: sliders[index]['title'],
                      text: sliders[index]['text'],
                    )
                ),
              ),

              SizedBox(height: 20.0),

              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        sliders.length,
                            (index) => buildSliderNav(index: index),
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          SkipButton(
                              tapEvent: () {
                                widget.prefs.setBool('seen', true);
                                Navigator.of(context).pushNamed("/welcome");
                              }
                          ),

                          Spacer(),

                          MainButton(
                            tapEvent: () {
                              if (selectedSlider != (sliders.length - 1)) {
                                sliderController.animateToPage(selectedSlider + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                              }else{
                                widget.prefs.setBool('seen', true);
                                Navigator.of(context).pushNamed("/welcome");
                              }
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildSliderNav({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: selectedSlider == index ? Color(0xFF158f08) : Color(0xFFD7D7D7),
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}