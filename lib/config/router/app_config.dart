import 'package:go_router/go_router.dart';
import 'package:page_indicator/ui/screens/intro_pages/onBoarding_screen.dart';
import 'package:page_indicator/ui/screens/login_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnBoardingScreen()
    ),
    
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login(),
    )
  ]
);