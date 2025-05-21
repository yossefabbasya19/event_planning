import 'package:evently_plan/core/colors_maneger.dart';
import 'package:flutter/material.dart';

class SearchTextFormFeild extends StatelessWidget {
  final String? Function(String?)? onChange;
  final TextEditingController? searchController;
  const SearchTextFormFeild({super.key, this.onChange, this.searchController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      controller: searchController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.blue),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.blue),
        ),
        prefixIcon: Icon(
          Icons.search_outlined,
          size: 30,
          color: ColorsManager.blue,
        ),
        hintStyle: Theme.of(context).textTheme.labelMedium,
        hintText: "Search for Event",
      ),
    );
  }
}
