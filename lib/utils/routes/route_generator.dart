import 'package:breathin/database/db.dart';
import 'package:breathin/models/audio_model.dart';
import 'package:breathin/screens/home/links.dart';
import 'package:breathin/screens/listening/links.dart';
import 'package:breathin/utils/extensions/page_route_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/authentication/login/links.dart';
import '../../screens/error.dart';
import 'app_routes.dart';

abstract class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.login:
        return BlocProvider(create: (_) => LoginCubit(Db()), child: const LoginView()).materialPageRoute;
      case AppRoute.home:
        return BlocProvider(create: (_) => HomeCubit(Db()), child: const HomeView()).materialPageRoute;
      case AppRoute.listening:
        return BlocProvider(create: (_) => ListeningCubit(audio: settings.arguments as AudioModel), child: const ListeningView()).materialPageRoute;
      default:
        return const ErrorView().materialPageRoute;
    }
  }
}
