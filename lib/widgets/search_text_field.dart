import 'package:flutter/material.dart';
import 'package:workout_hard/resources/icons_manager.dart';
import 'package:workout_hard/resources/strings_manager.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchTextController = TextEditingController();
    final FocusNode searchTextFocusNode = FocusNode();

    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: TextField(
        focusNode: searchTextFocusNode,
        controller: searchTextController,
        onChanged: (value) {},
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.cyan, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(width: 1)),
            hintText: AppStrings.searchText,
            prefixIcon: const Icon(AppIcons.search),
            suffix: IconButton(
              onPressed: () {
                searchTextController.clear();
                searchTextFocusNode.unfocus();
              },
              icon: const Icon(
                AppIcons.close,
                color: Colors.red,
              ),
            ),
            iconColor: Colors.white),
      ),
    );
  }
}
