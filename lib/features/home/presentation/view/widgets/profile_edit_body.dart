import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_button.dart';
import 'package:ekhtarly_app/features/home/data/model/profile.dart';
import 'package:ekhtarly_app/features/home/manger/cubit/profile_cubit.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/profile_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileEditBody extends StatelessWidget {
  const ProfileEditBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Edit Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileSuccess) {
            return profileEditBody(
              profile: state.profile,
            );
          } else {
            return Center(child: Text('there was an error!'));
          }
        },
      ),
    );
  }
}

class profileEditBody extends StatelessWidget {
  const profileEditBody({
    super.key,
    required this.profile,
  });
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
          const Text(
            'Name',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff707B81),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 12,
          ),
          CutsomTextForm(
            text: profile.name?? 'Jon Sina',
          ),
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Email',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff707B81),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 12,
          ),
          CutsomTextForm(
            text: profile.email!,
          ),
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
          GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kchangePassword);
              },
              child: const Details_Field(text: '**********')),
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
    );
  }
}

class CutsomTextForm extends StatelessWidget {
  const CutsomTextForm({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: TextField(
        onTap: onTap,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: Color(0xff2B2B2B).withOpacity(0.8)),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            fillColor: Color(0xffF7F7F9),
            filled: true),
      ),
    );
  }
}
