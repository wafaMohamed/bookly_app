import 'package:bookly_app/features/home/presentation/views/widgets/similar_book_listview.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/styles.dart';

class BooksDetailsSectionsTwo extends StatelessWidget {
  const BooksDetailsSectionsTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "you can also like ",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SimilarBookListView(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
