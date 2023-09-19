import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/styles.dart';
import 'book_action.dart';
import 'book_rate.dart';
import 'custom_book_detail_appbar.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookModel})
      : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const CustomAppBArBook(),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? "",
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 11,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors![0],
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        BookingRate(
          mainAxisAlignment: MainAxisAlignment.center,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
          rating: bookModel.volumeInfo.averageRating ?? 0,
        ),
        const SizedBox(
          height: 30,
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: BooksActions(bookModel: bookModel,),
        ),
      ],
    );
  }
}
