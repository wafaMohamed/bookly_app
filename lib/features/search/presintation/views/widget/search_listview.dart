import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart'; // Add the import for BookItem
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utilits/app_router.dart';
import '../../manager/cubit/search_cubit.dart';
import '../../manager/cubit/search_state.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchSuccessState) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          itemCount: state.books.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              GoRouter.of(context)
                  .pushNamed(AppRouter.detailsView, extra: state.books[index]);
            },
            child: BookItem(
              bookModel: state.books[index],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 15.0),
        );
      } else if (state is SearchFailureState) {
        return CustomErrorWidget(
          errMessage: state.error,
        );
      } else if (state is SearchLoadingState) {
        return const CustomLoadingIndicator();
      }

      return Container();
    });
  }
}
