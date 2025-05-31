import 'package:flutter/cupertino.dart';
import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/DM/user_DM.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier{
  void addEvent(
    LatLng latLng,
    TextEditingController titleController,
    TextEditingController descriptionController,
    Category? selectedCategory,
    DateTime? eventDate,
    BuildContext context,
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
    Navigator.pop(context);
  }



  Future<DateTime> chooseDate(BuildContext context) async {
    DateTime selectDate =
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
            DateTime.now();
    return selectDate;
  }


   Future<TimeOfDay> chooseTime(BuildContext context) async {
    late TimeOfDay eventTime;
    eventTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
            TimeOfDay.now();
    return eventTime;
  }

}

