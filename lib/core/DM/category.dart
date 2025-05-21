import 'package:evently_plan/core/assets_maneger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Category {
  final String id;
  final String name;
  final String imagePath;
  final IconData iconPath;

  Category({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.iconPath,
  });
}

List<Category> getcategorys(BuildContext context) {
  List<Category> categorys = [
    Category(
      id: "0",
      name: AppLocalizations.of(context)!.all,
      iconPath: Icons.category_outlined,
      imagePath: "",
    ),
    Category(
      id: "1",
      name: AppLocalizations.of(context)!.sport,
      imagePath: AssetsManeger.sportImage,
      iconPath: Icons.fitness_center,
    ),
    Category(
      id: "2",
      name: AppLocalizations.of(context)!.meeting,
      imagePath: AssetsManeger.meetingImage,
      iconPath: Icons.meeting_room,
    ),
    Category(
      id: "3",
      name: AppLocalizations.of(context)!.birthday,
      imagePath: AssetsManeger.birthdayImage,
      iconPath: Icons.cake,
    ),
    Category(
      id: "4",
      name: AppLocalizations.of(context)!.eating,
      imagePath: AssetsManeger.eatingImage,
      iconPath: Icons.fastfood_outlined,
    ),
    Category(
      id: "5",
      name: AppLocalizations.of(context)!.holiday,
      imagePath: AssetsManeger.holidayImage,
      iconPath: Icons.holiday_village,
    ),
    Category(
      id: "6",
      name: AppLocalizations.of(context)!.gaming,
      imagePath: AssetsManeger.gameImage,
      iconPath: Icons.sports_esports,
    ),
    Category(
      id: "7",
      name: AppLocalizations.of(context)!.work_shop,
      imagePath: AssetsManeger.workShopImage,
      iconPath: Icons.work_history_sharp,
    ),
    Category(
      id: "8",
      name: AppLocalizations.of(context)!.exhibition,
      imagePath: AssetsManeger.exhibitionImage,
      iconPath: Icons.museum,
    ),
    Category(
      id: "9",
      name: AppLocalizations.of(context)!.book_hub,
      imagePath: AssetsManeger.bookHubImage,
      iconPath: Icons.book,
    ),
  ];
  return categorys;
}

List<Category> getCategorysWithOutAll(BuildContext context) {
  List<Category> categorys = [
    Category(
      id: "1",
      name: AppLocalizations.of(context)!.sport,
      imagePath: AssetsManeger.sportImage,
      iconPath: Icons.fitness_center,
    ),
    Category(
      id: "2",
      name: AppLocalizations.of(context)!.meeting,
      imagePath: AssetsManeger.meetingImage,
      iconPath: Icons.meeting_room,
    ),
    Category(
      id: "3",
      name: AppLocalizations.of(context)!.birthday,
      imagePath: AssetsManeger.birthdayImage,
      iconPath: Icons.cake,
    ),
    Category(
      id: "4",
      name: AppLocalizations.of(context)!.eating,
      imagePath: AssetsManeger.eatingImage,
      iconPath: Icons.fastfood_outlined,
    ),
    Category(
      id: "5",
      name: AppLocalizations.of(context)!.holiday,
      imagePath: AssetsManeger.holidayImage,
      iconPath: Icons.holiday_village,
    ),
    Category(
      id: "6",
      name: AppLocalizations.of(context)!.gaming,
      imagePath: AssetsManeger.gameImage,
      iconPath: Icons.sports_esports,
    ),
    Category(
      id: "7",
      name: AppLocalizations.of(context)!.work_shop,
      imagePath: AssetsManeger.workShopImage,
      iconPath: Icons.work_history_sharp,
    ),
    Category(
      id: "8",
      name: AppLocalizations.of(context)!.exhibition,
      imagePath: AssetsManeger.exhibitionImage,
      iconPath: Icons.museum,
    ),
    Category(
      id: "9",
      name: AppLocalizations.of(context)!.book_hub,
      imagePath: AssetsManeger.bookHubImage,
      iconPath: Icons.book,
    ),
  ];
  return categorys;
}
