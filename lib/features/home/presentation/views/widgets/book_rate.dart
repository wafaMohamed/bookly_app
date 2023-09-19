import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants/constans.dart';
import '../../../../../core/styles/styles.dart';

class BookingRate extends StatelessWidget {
  const BookingRate(
      {Key? key,
      required this.mainAxisAlignment,
      required this.count, required this.rating})
      : super(key: key);
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: yellowColor,
          size: 15,
        ),
        const SizedBox(
          width: 6,
        ),
         Text(
          rating.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "($count)",
          style: Styles.textStyle14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
