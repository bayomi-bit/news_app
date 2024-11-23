import 'package:go_router/go_router.dart';
import 'package:news/core/router/router_const.dart';
import 'package:news/featurs/details_screen/ui/details_screen.dart';

import '../../featurs/home/model/article_mode.dart';
import '../../featurs/home/ui/home.dart';

class AppRouter{
  static final GoRouter router = GoRouter(
    initialLocation: RouterConst.home,
    routes: [
      GoRoute(path: RouterConst.home,
        builder: (context, state) => const Home(),


      ),
      GoRoute(path: RouterConst.details,
        builder: (context, state) {

          final article = state.extra as Article;

        return DetailsScreen(article: article,);})
    ]



  );
}