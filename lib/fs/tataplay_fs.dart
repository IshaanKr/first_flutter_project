import 'package:first_flutter_project/home_screen/home_screen_cubit.dart';
import 'package:first_flutter_project/splash_screen/splash_screen.dart';
import 'package:first_flutter_project/widgets/focusable_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../home_screen/home_screen.dart';
import '../utils/helpers.dart';
import '../widgets/video.dart';

class TataPlayFS extends StatelessWidget {
  const TataPlayFS({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        debugLogDiagnostics: isDebug,
        initialLocation: "/splash",
        routes: [
          GoRoute(
            path: "/",
            builder: (_, __) => Scaffold(
              body: Container(
                decoration: tpBgDecoration,
                child: BlocProvider(
                  create: (_) => HomeScreenCubit(),
                  child: const HomeScreen(),
                  // child: const FocusableList(),
                ),
              ),
            ),
          ),
          GoRoute(
            path: "/splash",
            builder: (_, __) => SplashScreen(),
          )
        ],
      ),
    );
  }
}
