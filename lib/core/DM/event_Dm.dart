import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/constant.dart';
import 'package:flutter/cupertino.dart';

class EventDm {
  String eventID;
  String userID;
  final String title;
  final String description;
  final Category category;
  final DateTime eventDate;
  final double? lat;
  final double? lng;

  EventDm({
    required this.userID,
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
      userID: json["userID"],
      lat: json['lat'],
      lng: json['long'],
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
      'userID':userID,
      "id":eventID,
      kEventTitle: title,
      kEventDescription: description,
      kEventCategory: category.id,
      kEventEventDate:Timestamp.fromDate(eventDate),
      "lat":lat,
      "long":lng,
    };
  }
}
