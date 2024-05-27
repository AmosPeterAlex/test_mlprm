import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_nexteons/screen/frame/view.dart';
import 'package:test_nexteons/screen/home/view_home.dart';
import 'package:test_nexteons/screen/login/view.dart';
import 'package:test_nexteons/utils/constants/app_constants.dart';

final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: "/login",
    // shell route chyanm

    routes: [
      GoRoute(
        name: "Login",
        path: '/login',
        builder: (context, state) => LoginView(),
      ),
      ShellRoute(
          builder: (context, state, child) => FrameView(child: child),
          routes: [
            GoRoute(
              name: "Home",
              path: '/home',
              builder: (context, state) => HomeView(),
            ),
          ])

      // GoRoute(
      //   name: "Frame",
      //   path: '/frame',
      //   builder: (context, state) => FrameView(
      //     child: null,
      //   ),
      // ),
    ]);

// Future<bool> isLogged() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? accessToken = prefs.getString("LOGIN");
//   return accessToken != null;
// }