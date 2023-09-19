part of 'similar_books_cubit.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();
}

class SimilarBooksInitial extends SimilarBooksState {
  @override
  List<Object> get props => [];
}
class SimilarBooksLoading extends SimilarBooksState {
  @override
  List<Object> get props => [];
}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSuccess(this.books);

  @override
  List<Object> get props => [];
}

class SimilarBooksFailure extends SimilarBooksState {
  final String errorMessage;

  const SimilarBooksFailure(this.errorMessage);
  @override
  List<Object> get props => [];
}