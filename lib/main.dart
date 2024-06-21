import 'package:dio/dio.dart';
import 'package:ekhtarly_app/core/utils/api_service.dart';
import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/service_locator.dart';
import 'package:ekhtarly_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:ekhtarly_app/features/authentication/manger/forgot_password_change_cubit/forgot_password_change_cubit.dart';
import 'package:ekhtarly_app/features/authentication/manger/forgot_password_send_code_cubit/forgot_password_send_code_cubit.dart';
import 'package:ekhtarly_app/features/authentication/manger/forgot_password_submit_code_cubit/forgot_password_submit_code_cubit.dart';
import 'package:ekhtarly_app/features/authentication/manger/resend_cubit/resned_cubit.dart';
import 'package:ekhtarly_app/features/authentication/manger/otp_verify_email_cubit/otp_cubit.dart';
import 'package:ekhtarly_app/features/authentication/manger/register_cubit/register_cubit.dart';
import 'package:ekhtarly_app/features/comprasion/presentation/view_model/cubit/comprasion_cubit.dart';
import 'package:ekhtarly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:ekhtarly_app/features/home/presentation/manger/change_password/change_password_cubit.dart';
import 'package:ekhtarly_app/features/home/presentation/manger/newest_laptops_cubit/newest_laptops_cubit.dart';
import 'package:ekhtarly_app/features/home/presentation/manger/profile/profile_cubit.dart';
import 'package:ekhtarly_app/features/search/data/repo/search_repositert_implementation.dart';
import 'package:ekhtarly_app/features/search/presentation/cubit/get_laptops/get_laptops_cubit.dart';
import 'package:ekhtarly_app/features/search/presentation/cubit/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/favourite/data/repos/favourite_repo_impl.dart';
import 'features/favourite/presentation/manger/add_favourite_cubit/add_favourite_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) =>
    const EkhtarlyApp(),
  );
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
        BlocProvider(
          create: (context) => OtpCubit(
            getIt.get<AuthRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => ResnedCubit(
            getIt.get<AuthRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordSendCodeCubit(
            getIt.get<AuthRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordSubmitCodeCubit(
            getIt.get<AuthRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordChangeCubit(
            getIt.get<AuthRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => NewestLaptopsCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => ChangePasswordCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit(
            getIt.get<FavouriteRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => ComprasionCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchImpl>()),
        ),
      
      ],
      child: MaterialApp.router(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(),
        ),
      ),
    );
  }
}
