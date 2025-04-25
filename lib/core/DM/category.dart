
import 'package:evently_plan/core/assets_maneger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

List<Category> categorys = [
  Category(id: "0", name: "All", iconPath: Icons.category_outlined,imagePath: ""),
  Category(
    id: "1",
    name: "sports",
    imagePath: AssetsManeger.sportImage,
    iconPath: Icons.fitness_center,
  ),
  Category(
    id: "2",
    name: "meeting",
    imagePath: AssetsManeger.meetingImage,
    iconPath: Icons.meeting_room,
  ),
  Category(
    id: "3",
    name: "birthday",
    imagePath: AssetsManeger.birthdayImage,
    iconPath: Icons.cake,
  ),
  Category(
    id: "4",
    name: "eating ",
    imagePath: AssetsManeger.eatingImage,
    iconPath: Icons.fastfood_outlined,
  ),
  Category(
    id: "5",
    name: "holiday",
    imagePath: AssetsManeger.holidayImage,
    iconPath: Icons.holiday_village,
  ),
  Category(
    id: "6",
    name: "gaming",
    imagePath: AssetsManeger.gameImage,
    iconPath: Icons.sports_esports,
  ),
  Category(
    id: "7",
    name: "workShop",
    imagePath: AssetsManeger.workShopImage,
    iconPath: Icons.work_history_sharp,
  ),
  Category(
    id: "8",
    name: "exhibition",
    imagePath: AssetsManeger.exhibitionImage,
    iconPath: Icons.museum,
  ),
  Category(
    id: "9",
    name: "Book Hub",
    imagePath: AssetsManeger.bookHubImage,
    iconPath: Icons.book,
  ),
];
List<Category> categorysWithOutAll = [
  Category(
    id: "0",
    name: "sports",
    imagePath: AssetsManeger.sportImage,
    iconPath: Icons.fitness_center,
  ),
  Category(
    id: "1",
    name: "meeting",
    imagePath: AssetsManeger.meetingImage,
    iconPath: Icons.meeting_room,
  ),
  Category(
    id: "2",
    name: "birthday",
    imagePath: AssetsManeger.birthdayImage,
    iconPath: Icons.cake,
  ),
  Category(
    id: "3",
    name: "eating ",
    imagePath: AssetsManeger.eatingImage,
    iconPath: Icons.fastfood_outlined,
  ),
  Category(
    id: "4",
    name: "holiday",
    imagePath: AssetsManeger.holidayImage,
    iconPath: Icons.holiday_village,
  ),
  Category(
    id: "5",
    name: "gaming",
    imagePath: AssetsManeger.gameImage,
    iconPath: Icons.sports_esports,
  ),
  Category(
    id: "6",
    name: "workShop",
    imagePath: AssetsManeger.workShopImage,
    iconPath: Icons.work_history_sharp,
  ),
  Category(
    id: "7",
    name: "exhibition",
    imagePath: AssetsManeger.exhibitionImage,
    iconPath: Icons.museum,
  ),
  Category(
    id: "8",
    name: "Book Hub",
    imagePath: AssetsManeger.bookHubImage,
    iconPath: Icons.book,
  ),
];
