import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/features/home/data/model/profile.dart';
import 'package:ekhtarly_app/features/home/manger/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getProfile();
  }

  Profile? profile;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        child: ListView(
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileSuccess) {
                  return const MyHeader();
                } else {
                  return Container();
                }
              },
            ),
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
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kComprasion);
              },
              child: const ListTile(
                title: Text(
                  'Comprasion',
                  style: TextStyle(
                      color: Color(0xff0D0D26),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                leading: Icon(
                  FontAwesomeIcons.scaleBalanced,
                  size: 20,
                ),
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
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
              },
              child: const ListTile(
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
              ),
            )
          ],
        ));
  }
}

class MyHeader extends StatefulWidget {
  const MyHeader({super.key, this.textcolor});
  final Color? textcolor;

  @override
  State<MyHeader> createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  late Profile profile;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    profile = BlocProvider.of<ProfileCubit>(context).getmyprofile();

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
        Text(
          profile.name ?? '',
          style: const TextStyle(
              color: Color(0xff0D0D26),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        Text(
          profile.email ?? 'jonsina@gmail.com',
          style: TextStyle(color: widget.textcolor ?? const Color(0xff95969D)),
        ),
      ]),
    );
  }
}
