import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/constant.dart';
import 'package:flutter/cupertino.dart';

class EventDm {
  String eventID;
  final String title;
  final String description;
  final Category category;
  final DateTime eventDate;
  final int? lat;
  final int? lng;

  EventDm({
    this.eventID = '',
    required this.title,
    required this.description,
    required this.category,
    required this.eventDate,
    this.lat,
    this.lng,
  });

  factory EventDm.fromJson(json, BuildContext context) {
    return EventDm(
      eventID:json["id"],
      title: json[kEventTitle],
      description: json[kEventDescription],
      category: getCategorysWithOutAll(
        context,
      ).firstWhere((element) => element.id == json[kEventCategory]),
      eventDate: json[kEventEventDate].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id":eventID,
      kEventTitle: title,
      kEventDescription: description,
      kEventCategory: category.id,
      kEventEventDate:Timestamp.fromDate(eventDate),
    };
  }
}
