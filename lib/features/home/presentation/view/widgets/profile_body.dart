import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountProfileBody extends StatelessWidget {
  const AccountProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          Text(
            'Name',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff707B81),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 12,
          ),
          Details_Field(text: 'Jon Sina'),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Email',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff707B81),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 12,
          ),
          Details_Field(text: 'jonsina@gmail.com'),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Password',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff707B81),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 12,
          ),
          const Details_Field(text: '**********'),
          const Align(
            alignment: FractionalOffset.centerRight,
            child: Text(
              'Recovery password',
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff707B81),
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            onPressed: () {},
            colorButton: kButtonColor,
            colorText: Colors.white,
            text: 'Edit',
          ),
        ]),
      ),
    );
  }
}

class Details_Field extends StatelessWidget {
  const Details_Field({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: const Color(0xffF7F7F9),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 14, top: 15, bottom: 15),
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: Color(0xff2B2B2B)),
        ),
      ),
    );
  }
}