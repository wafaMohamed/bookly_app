import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utilits/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation(this.apiService);

  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchBooks(
      {required String bookName}) async {
    try {
      var data = await apiService.get(
          endPoints: "volumes?Filtering=free-ebooks&q=$bookName");

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
