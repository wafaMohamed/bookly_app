import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:bookly_app/features/search/presintation/manager/cubit/search_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/book_model.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitialState());

  final SearchRepo searchRepo;

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> fetchSearedBooks({required String bookName}) async {
    emit(SearchLoadingState());
    Either<Failures, List<BookModel>> result;
    result = await searchRepo.fetchSearchBooks(bookName: bookName);
    result.fold((failure) {
      emit(SearchFailureState(failure.errorMessage));
    }, (books) {
      emit(SearchSuccessState(books));
    });
  }

  TextEditingController searchController = TextEditingController();
}
