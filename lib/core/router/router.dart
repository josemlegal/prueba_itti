import 'package:go_router/go_router.dart';
import 'package:prueba_itti/domain/models/user_model.dart';
import 'package:prueba_itti/presentation/views/onboarding_view.dart';
import 'package:prueba_itti/presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/onboarding-view',
  routes: [
    GoRoute(
      path: '/login-view',
      name: LoginView.name,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: '/',
      name: UsersView.name,
      builder: (context, state) => const UsersView(),
    ),
    GoRoute(
      path: '/user-details',
      name: UserDetailsView.name,
      builder: (context, state) {
        final user = state.extra as User;
        return UserDetailsView(user: user);
      },
    ),
    GoRoute(
      path: '/settings-view',
      name: SettingsView.name,
      builder: (context, state) => const SettingsView(),
    ),
    GoRoute(
      path: '/onboarding-view',
      name: OnboardingView.name,
      builder: (context, state) => const OnboardingView(),
    ),
  ],
);
