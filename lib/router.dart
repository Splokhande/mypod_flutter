import 'package:flutter/foundation.dart';
import 'package:mypod_flutter/import_helper.dart';
import 'package:mypod_flutter/views/login&register/login.dart';
import 'package:mypod_flutter/views/mobileView/my_home/my_home_view.dart';
import 'package:mypod_flutter/views/splashscreen.dart';

const String home = 'home';
const String splashscreen = 'splashscreen';
const String login = 'login';
const String register = 'register';
const String myHome = 'my_home';
const String myMaintenanceBook = 'my_maintenance_book';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: splashscreen,
      path: '/',
      builder: (context, state) => const Splashscreen(),
      redirect: (context, state) {
        final auth = sessionManager.isSignedIn;
        if (auth) {
          return '/$home';
        } else {
          return '/$login';
        }
      },
    ),
    GoRoute(
        name: login,
        path: '/$login',
        builder: (context, state) => const LoginView()),
    GoRoute(
        name: home,
        path: '/$home',
        builder: (context, state) =>
            // const MyHomeView(),
            kIsWeb ? const WebViewHomeScreen() : const MobileHomeScreen(),
        routes: [
          GoRoute(
              name: myHome,
              path: myHome,
              builder: (context, state) => const MyHomeView()),
          GoRoute(
              name: myMaintenanceBook,
              path: myMaintenanceBook,
              builder: (context, state) => const MyMaintainanceBook()),
        ]),
    // GoRoute(
    //     name: login,
    //     path: '/$login',
    //     builder: (context, state) => const LoginView()),
    // GoRoute(
    //   name: home,
    //   path: '/$home',
    //   builder: (context, state) =>
    //       // const MyHomeView(),
    //       kIsWeb ? const WebViewHomeScreen() : const MobileHomeScreen(),
    // ),
  ],
);
