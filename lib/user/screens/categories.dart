import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/widgets/CategoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: CategoryItem(
                      icon: EvaIcons.giftOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFffa100),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CategoryItem(
                      icon: EvaIcons.headphonesOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFF200bfff),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CategoryItem(
                      icon: EvaIcons.hardDriveOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFff91c90),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CategoryItem(
                      icon: EvaIcons.printerOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFF9120de),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CategoryItem(
                      icon: EvaIcons.videoOffOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFF17e6a9),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CategoryItem(
                      icon: EvaIcons.umbrellaOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFff788e),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CategoryItem(
                      icon: EvaIcons.tvOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFff8176),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
