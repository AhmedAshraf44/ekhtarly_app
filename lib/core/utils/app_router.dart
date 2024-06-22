import 'package:dio/dio.dart';
import 'package:ekhtarly_app/core/utils/api_service.dart';
import 'package:ekhtarly_app/features/authentication/otp_verify_email/presentation/view/otp_view.dart';
import 'package:ekhtarly_app/features/authentication/registration/presentation/view/register_view.dart';
import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:ekhtarly_app/features/comprasion/presentation/views/comprasion_view.dart';
import 'package:ekhtarly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:ekhtarly_app/features/home/manger/profile/profile_cubit.dart';
import 'package:ekhtarly_app/features/home/presentation/view/home_view.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/change_password.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/profile_edit_body.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/profile_body.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/setting.dart';
import 'package:ekhtarly_app/features/introduction_screen/presentation/view/intro_view.dart';
<<<<<<< HEAD
=======
import 'package:ekhtarly_app/features/search/data/repo/search_repositert_implementation.dart';
import 'package:ekhtarly_app/features/search/data/repo/search_repsitery.dart';
import 'package:ekhtarly_app/features/search/presentation/cubit/get_laptops/get_laptops_cubit.dart';
import 'package:ekhtarly_app/features/search/presentation/cubit/search/search_cubit.dart';
>>>>>>> 972a371abda74f5579881c1e7c40d5508fa3ef30
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/authentication/forget_password/presentation/view/change_new_password_view.dart';
import '../../features/authentication/forget_password/presentation/view/otp_forget_passwoed_view.dart';
import '../../features/authentication/forget_password/presentation/view/success_view.dart';
import '../../features/authentication/data/models/person_model.dart';
import '../../features/authentication/login/presentation/view/login_view.dart';
import '../../features/favourite/presentation/view/favourite_view.dart';
import '../../features/authentication/forget_password/presentation/view/forget_passwoed_view.dart';
import '../../features/home/presentation/view/newest_laptops_view.dart';
import '../../features/search/presentation/view/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kIntroductionView = '/IntroductionView';
  static const kRegisterView = '/RegisterView';
  static const kLoginView = '/LoginView';
  static const kHomeView = '/HomeView';
  static const kForgetPasswordView = '/ForgetPasswordView';
// static const kCheckEmailView = '/CheckEmailView';
  static const kChangeNewPasswordView = '/ChangeNewPasswordView';
  static const kSuccessView = '/SuccessView';
  static const kSearchView = '/SearchView';
  static const kFavouriteView = '/FavouriteView';
  static const kOtpView = '/OtpView';
  static const kOtpForgetPasswordView = '/OtpForgetPasswordView';
  static const kNewestLaptopsView = '/NewestLaptopsView';
  static const kProfile = '/Profile';
  static const kSetting = '/setting';
  static const kprofileedit = '/profileedit';
  static const kchangePassword = '/changePassword';
  static const kComprasion = '/comprasion';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kIntroductionView,
      builder: (context, state) => const IntroductionView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kProfile,
      builder: (context, state) => const AccountProfileBody(),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kSetting,
      builder: (context, state) => const SettingScreen(),
    ),
    GoRoute(
      path: kComprasion,
      builder: (context, state) => ComprasionView(),
    ),
    GoRoute(
      path: kchangePassword,
      builder: (context, state) => const ChangePassowrd(),
    ),
    GoRoute(
      path: kForgetPasswordView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    //  GoRoute(
    //   path: kCheckEmailView,
    //   builder: (context, state) => const CheckEmailView(),
    //  ),
    GoRoute(
      path: kChangeNewPasswordView,
      builder: (context, state) {
        final model = state.extra as Model?;
        return ChangeNewPasswordView(model: model!);
      },
    ),
    GoRoute(
      path: kSuccessView,
      builder: (context, state) => const SuccessView(),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: kFavouriteView,
      builder: (context, state) => const FavouriteView(),
    ),
    GoRoute(
      path: kprofileedit,
      builder: (context, state) => const ProfileEditBody(),
    ),
    GoRoute(
        path: kOtpView,
        builder: (context, state) {
          final email = state.extra as String?;
          return OtpView(
            email: email,
          );
        }),
    GoRoute(
        path: kOtpForgetPasswordView,
        builder: (context, state) {
          final email = state.extra as String?;
          return OtpForgetPasswordView(
            email: email!,
          );
        }),
    GoRoute(
      path: kNewestLaptopsView,
      builder: (context, state) {
        final laptops = state.extra as Laptops;
        return NewestLaptopsView(
          laptops: laptops,
        );
      },
    ),
  ]);
}
