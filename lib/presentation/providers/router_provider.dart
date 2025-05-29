import 'package:code_con_course_fe/presentation/pages/home_page.dart';
import 'package:code_con_course_fe/presentation/pages/register_page.dart';
import 'package:code_con_course_fe/presentation/pages/registration_status_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/check',
        name: 'check',
        builder: (context, state) => const RegistrationStatusPage(),
      ),
    ], initialLocation: '/home', debugLogDiagnostics: false);
