import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          backgroundColor: const Color(0xffFFFFFF),
          elevation: 0,
          child: ListView(
            children: [
              const MyHeader(),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kProfile);
                },
                child: const ListTile(
                  title: Text(
                    'Profile',
                    style: TextStyle(
                        color: Color(0xff0D0D26),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  leading: Icon(
                    FontAwesomeIcons.user,
                    size: 20,
                  ),
                ),
              ),
              const ListTile(
                title: Text(
                  'Favourite',
                  style: TextStyle(
                      color: Color(0xff0D0D26),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                leading: Icon(
                  FontAwesomeIcons.heart,
                  size: 20,
                ),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kSetting);
                },
                child: const ListTile(
                  title: Text(
                    'Setting',
                    style: TextStyle(
                        color: Color(0xff0D0D26),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  leading: Icon(
                    FontAwesomeIcons.gear,
                    size: 20,
                  ),
                ),
              ),
              const ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                      color: Color(0xffE30000),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                leading: Icon(
                  FontAwesomeIcons.arrowRightFromBracket,
                  size: 20,
                  color: Color(0xffE30000),
                ),
              )
            ],
          )),
    );
  }
}

class MyHeader extends StatelessWidget {
  const MyHeader({
    super.key,
    this.textcolor
  });
  final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 80,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/profile.png'))),
        ),
        const Text(
          'Jon Sina',
          style: TextStyle(
              color: Color(0xff0D0D26),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
         Text(
          'jonsina@gmail.com',
          style: TextStyle(color: textcolor??const Color(0xff95969D)),
        ),
      ]),
    );
  }
}
