import 'dart:ui';
import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                    color: kSecondaryColor,
                    child: const MyHeader(
                      textcolor: Colors.black,
                    ))),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kchangePassword);
                    },
                    onLongPress: () {},
                    child: const ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Change Password'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Divider(
                      height: 8,
                    ),
                  ),
                  InkWell(
                    onLongPress: () {},
                    child: const ListTile(
                      leading: Icon(Icons.language),
                      title: Text('Change Language'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Preferences',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            SwitchListTile(
              title: const Text(
                'Dark Mode',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              value: isSelected1,
              onChanged: (value) {
                isSelected1 = value;
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
