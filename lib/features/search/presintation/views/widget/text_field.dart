import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../manager/cubit/search_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: SearchCubit.get(context).searchController,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            suffixIconColor: Colors.white,
            focusColor: Colors.white,
            iconColor: Colors.white,
            focusedBorder: borderShape(),
            enabledBorder: borderShape(),
            hintText: "Search",
            suffixIcon: IconButton(
              icon: const Opacity(
                opacity: 0.7,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 22,
                ),
              ),
              onPressed: () {
                if (SearchCubit.get(context).searchController.text.isNotEmpty) {
                  SearchCubit.get(context).fetchSearedBooks(
                    bookName: SearchCubit.get(context).searchController.text,
                  );
                }
              },
            )),
        onEditingComplete: () {
          final searchController = SearchCubit.get(context)?.searchController;
          if (searchController?.text?.isNotEmpty == true) {
            SearchCubit.get(context)?.fetchSearedBooks(
              bookName: searchController!.text,
            );
          }
        });
  }

  OutlineInputBorder borderShape() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white));
  }
}
