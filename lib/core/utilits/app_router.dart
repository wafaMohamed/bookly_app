import 'package:bookly_app/core/utilits/service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implemntation.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presintation/views/search_views.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const homeView = "/homeViewRouter";
  static const detailsView = "/bookDetailsViewRouter";
  static const searchViews = "/searchViewsRouter";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: detailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: searchViews,
        builder: (context, state) => const SearchViews(),
      ),
    ],
  );
}
