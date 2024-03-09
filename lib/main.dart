import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/service_locator.dart';
import 'package:ekhtarly_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:ekhtarly_app/features/authentication/login/manger/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  setupServiceLocator();
  runApp(const EkhtarlyApp());
}

class EkhtarlyApp extends StatelessWidget {
  const EkhtarlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(
           getIt.get<AuthRepoImpl>(),
          ),
        ),
      ],
      child: MaterialApp.router(
       // color:const Color(0xffE5E5E5),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(textTheme:GoogleFonts.interTextTheme(),
        ),
      ),
    );
  }
}
