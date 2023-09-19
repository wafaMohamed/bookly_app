import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final imageUrl =
                    state.books[index].volumeInfo.imageLinks?.thumbnail;

                // Check if the imageUrl is valid
                if (imageUrl != null && imageUrl.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      imageUrl: imageUrl,
                    ),
                  );
                } else {
                  return const SizedBox(); // You can return an empty container or an error indicator
                }
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return const CustomErrorWidget(
            errMessage: 'state.errorMessage',
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
