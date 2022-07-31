import 'package:flutter/material.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';


class BlogCard extends StatelessWidget {
  final String url;
  final String title;
  final String date;

  const BlogCard({Key key, this.url,this.title,this.date}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: PsColors.white,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0,bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.2,
              width: width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(
                      url,
                      height: height * 0.3,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: PsColors.mainColor,
                      child: Text(
                        "Published Date: " + date,
                        style: TextStyle(
                          fontSize: height * 0.015,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: height * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
          ],
        ),
      ),
    );
  }
}