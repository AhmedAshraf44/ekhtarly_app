import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_button.dart';
import 'package:ekhtarly_app/features/home/data/model/profile.dart';
import 'package:ekhtarly_app/features/home/manger/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';

class AccountProfileBody extends StatefulWidget {
  const AccountProfileBody({super.key});

  @override
  State<AccountProfileBody> createState() => _AccountProfileBodyState();
}

class _AccountProfileBodyState extends State<AccountProfileBody> {
  Profile? profile;
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: Styles.textStyle20,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccess) {
                return ProfileBody(profile: state.profile);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.profile,
  });

  final Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      DetailsField(text: profile?.name ?? 'Jon Sina'),
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
      DetailsField(text: profile?.email ?? 'jonsina@gmail.com'),
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
      const DetailsField(text: '**********'),
      const SizedBox(
        height: 40,
      ),
      CustomButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kprofileedit);
        },
        colorButton: kPrimaryColor,
        colorText: Colors.white,
        text: 'Edit',
      ),
    ]);
  }
}

class DetailsField extends StatelessWidget {
  const DetailsField({
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
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Color(0xff2B2B2B)),
          ),
          const Opacity(opacity: 0.7, child: Icon(Icons.edit_note)),
        ]),
      ),
    );
  }
}
