import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failures,List<BookModel>>> fetchSearchBooks(
      {required String bookName});
}