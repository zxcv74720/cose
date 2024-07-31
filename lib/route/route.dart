import 'package:cose_front/views/auth/local_login_screen.dart';
import 'package:cose_front/views/auth/login_screen.dart';
import 'package:cose_front/views/auth/reset_password_screen.dart';
import 'package:cose_front/views/auth/sign_up_screen.dart';
import 'package:cose_front/views/course/course_screen.dart';
import 'package:cose_front/views/map/create_course_screen.dart';
import 'package:cose_front/views/map/map_screen.dart';
import 'package:cose_front/views/notification/notification_screen.dart';
import 'package:cose_front/views/profile/profile_screen.dart';
import 'package:cose_front/views/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/storage_service.dart';
import '../views/profile/edit_profile_screen.dart';
import '../views/top/top_screen.dart';

final getUserFromStorage = GetLoginStatusFromStorage();

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (BuildContext context, GoRouterState state) async {
        final loginState = await getUserFromStorage.getLoginStatusFromStorage();
        return loginState ? '/home' : '/login';
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          path: 'sign-up',
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: 'local',
          builder: (context, state) => const LocalLoginScreen(),
          routes: [
            GoRoute(
              path: 'reset-password',
              builder: (context, state) => const ResetPasswordScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const TopScreen(),
    ),
    GoRoute(
      path: '/map',
      builder: (context, state) => const MapScreen(),
      routes: [
        GoRoute(
          path: 'search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: 'create-course',
          builder: (context, state) => const CreateCourseScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/course',
      builder: (context, state) => const CourseScreen(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => const NotificationScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
      routes: [
        GoRoute(
          path: 'edit',
          builder: (context, state) => const EditProfileScreen(),
        )
      ],
    ),
  ],
);