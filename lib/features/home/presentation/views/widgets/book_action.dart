import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utilits/functions/launch_url.dart';
import 'custom_button.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomButton(
            color: Colors.black,
            backGround: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            text: "19.9 \$",
            fontSize: 18,
          ),
        ),
        Expanded(
          child: CustomButton(
            onPresses: ()  {
              launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
            },
            color: Colors.white,
            backGround: const Color(0xffef8262),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            text: 'Free Preview',
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
