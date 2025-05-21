import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:flutter/cupertino.dart';

void addEvent(
    TextEditingController titleController,
    TextEditingController descriptionController,
    Category? selectedCategory,
    DateTime? eventDate,
    BuildContext context
    ) async {
  EventDm eventDm = EventDm(
    title: titleController.text,
    description: descriptionController.text,
    category: selectedCategory ?? getCategorysWithOutAll(context)[0],
    eventDate: eventDate ?? DateTime.now(),
  );
  await FirebaseService.addEvent(eventDm);
}