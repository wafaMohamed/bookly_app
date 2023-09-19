import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  /// Lift side = errors , Right side = success
  /// methods without implementation
  Future<Either<Failures, List<BookModel>>> fetchNewsBooks();

  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks();

  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
