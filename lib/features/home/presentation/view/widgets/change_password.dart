import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_button.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/profile_edit_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePassowrd extends StatelessWidget {
  const ChangePassowrd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Change Password'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
                radius: 40,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const Text(
              'Current Password',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff707B81),
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            CutsomTextForm(
              text: '********',
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'New Password',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff707B81),
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            CutsomTextForm(
              text: '********',
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'New Password Again',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff707B81),
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            CutsomTextForm(
              text: '********',
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onPressed: () {},
              colorButton: kButtonColor,
              colorText: Colors.white,
              text: 'Save Now',
            ),
          ]),
        ),
      ),
    );
  }
}
