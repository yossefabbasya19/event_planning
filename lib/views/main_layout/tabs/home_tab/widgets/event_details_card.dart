
import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/assets_maneger.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/widgets/discrebtion_card.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/widgets/display_datetime_card.dart';
import 'package:flutter/material.dart';

class EventDetailsCard extends StatelessWidget {
  final EventDm eventDm;
  const EventDetailsCard({super.key, required this.eventDm});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16),
      width: double.infinity,
      height: 203,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AssetsManeger.bookHubImage),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DisplayDatetimeCard(dateTime: eventDm.eventDate),
          descriptionCard(
            description: eventDm.description,
          ),
        ],
      ),
    );
  }
}
