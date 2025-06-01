import 'package:code_con_course_fe/presentation/pages/home_page.dart';
import 'package:code_con_course_fe/presentation/pages/register_page.dart';
import 'package:code_con_course_fe/presentation/pages/registration_status_page.dart';
import 'package:code_con_course_fe/presentation/pages/return_page.dart';
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
      GoRoute(
        path: '/return',
        name: 'return',
        builder: (context, state) {
          var params = state.uri.queryParameters;

          return ReturnPage(
              merchantOrderId: '${params['merchantOrderId']}',
              resultCode: '${params['resultCode']}',
              reference: '${params['reference']}');
        },
        redirect: (context, state) {
          var params = state.uri.queryParameters;
          if (params.containsKey('merchantOrderId') &&
              params.containsKey('resultCode') &&
              params.containsKey('reference')) {
            return null;
          }

          return '/home';
        },
      ),
    ], initialLocation: '/home', debugLogDiagnostics: false);
