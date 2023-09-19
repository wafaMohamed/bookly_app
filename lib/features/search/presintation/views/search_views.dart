import 'package:bookly_app/features/search/presintation/views/widget/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchViews extends StatelessWidget {
  const SearchViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
