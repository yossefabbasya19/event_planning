import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/DM/user_DM.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void addEvent(
    LatLng latLng,
    TextEditingController titleController,
    TextEditingController descriptionController,
    Category? selectedCategory,
    DateTime? eventDate,
    BuildContext context
    ) async {
  EventDm eventDm = EventDm(
    userID: UserDm.currentUser!.userID,
    lat: latLng.latitude,
    lng: latLng.longitude,
    title: titleController.text,
    description: descriptionController.text,
    category: selectedCategory ?? getCategorysWithOutAll(context)[0],
    eventDate: eventDate ?? DateTime.now(),
  );
  await FirebaseService.addEvent(eventDm);
}