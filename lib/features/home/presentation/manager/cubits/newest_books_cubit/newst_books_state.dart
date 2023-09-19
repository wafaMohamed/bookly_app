part of 'newst_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();
}

class NewestBooksInitial extends NewestBooksState {
  @override
  List<Object> get props => [];
}

class NewestBooksLoading extends NewestBooksState {
  @override
  List<Object> get props => [];
}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;

  const NewestBooksSuccess(this.books);

  @override
  List<Object> get props => [];
}

class NewestBooksFailure extends NewestBooksState {
final String errorMessage;

  const NewestBooksFailure(this.errorMessage);
@override
  List<Object> get props => [];
}
