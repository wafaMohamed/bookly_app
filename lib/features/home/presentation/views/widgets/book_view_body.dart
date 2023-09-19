import 'package:flutter/material.dart';
import '../../../data/models/book_model.dart';
import 'books_details_section_1.dart';
import 'books_details_section_2.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel}) : super(key: key);
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                BookDetailsSection(bookModel: bookModel,),
                const Expanded(
                  child: SizedBox(
                    height: 40,
                  ),
                ),
                const BooksDetailsSectionsTwo(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
