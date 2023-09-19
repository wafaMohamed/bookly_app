import 'package:bookly_app/features/home/data/repos/home_repo_implemntation.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/newest_books_cubit/newst_books_cubit.dart';
import 'package:bookly_app/features/search/presintation/manager/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/constans.dart';
import 'core/utilits/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utilits/service_locator.dart';
import 'features/search/data/repo/search_repo_implemntation.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// state operator ..
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) =>
              SearchCubit(getIt.get<SearchRepoImplementation>())
                ..fetchSearedBooks(bookName: ''),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
