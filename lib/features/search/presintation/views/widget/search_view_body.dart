
import 'package:bookly_app/features/search/presintation/views/widget/search_listview.dart';
import 'package:bookly_app/features/search/presintation/views/widget/text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          CustomTextField(),
          SizedBox(
            height: 15,
          ),
          Expanded(child: SearchListView(),),
        ],
      ),
    );
  }
}

