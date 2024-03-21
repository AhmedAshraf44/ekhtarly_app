
import 'package:ekhtarly_app/features/authentication/otp_verify_email/presentation/view/otp_view.dart';
import 'package:ekhtarly_app/features/authentication/registration/presentation/view/register_view.dart';
import 'package:ekhtarly_app/features/forget_password/presentation/view/change_new_password_view.dart';
import 'package:ekhtarly_app/features/forget_password/presentation/view/check_email_view.dart';
import 'package:ekhtarly_app/features/forget_password/presentation/view/success_view.dart';
import 'package:ekhtarly_app/features/home/presentation/view/home_view.dart';
import 'package:ekhtarly_app/features/introduction_screen/presentation/view/intro_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/authentication/login/presentation/view/login_view.dart';
import '../../features/favourite/presentation/view/favourite_view.dart';
import '../../features/forget_password/presentation/view/forget_passwoed_view.dart';
import '../../features/search/presentation/view/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {

static const kIntroductionView = '/IntroductionView';
static const kRegisterView = '/RegisterView';
static const kLoginView = '/LoginView';
static const kHomeView = '/HomeView';
static const kForgetPasswordView = '/ForgetPasswordView';
static const kCheckEmailView = '/CheckEmailView';
static const kChangeNewPasswordView = '/ChangeNewPasswordView';
static const kSuccessView = '/SuccessView';
static const kSearchView = '/SearchView';
static const kFavouriteView = '/FavouriteView';
static const kOtpView ='/OtpView';

static final router = GoRouter(
  routes: 
  [
   GoRoute(
    path: '/',
    builder: (context, state) =>const SplashView(),
    ),
    GoRoute(
    path: kIntroductionView,
    builder: (context, state) =>const IntroductionView(),
    ),
     GoRoute(
    path: kLoginView,
    builder: (context, state) =>const LoginView(),
    ),
     GoRoute(
    path: kRegisterView,
    builder: (context, state) =>const RegisterView(),
    ),
     GoRoute(
    path: kHomeView,
    builder: (context, state) =>const HomeView(),
    ),
     GoRoute(
    path: kForgetPasswordView,
    builder: (context, state) =>const ForgetPasswordView(),
    ),
     GoRoute(
      path: kCheckEmailView,
      builder: (context, state) => const CheckEmailView(),
     ),
      GoRoute(
      path: kChangeNewPasswordView,
      builder: (context, state) => const ChangeNewPasswordView(),
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
      path: kOtpView,
      builder: (context, state) {
         final email = state.extra as String?;
        return  OtpView(email: email,);}
     ),
  ]
  );



}
