import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/views/main_layout/tabs/map_tab/widgets/event_card_in_map.dart';
import 'package:flutter/material.dart';

class EventCardListView extends StatelessWidget {
 final  List<EventDm> events;
  const EventCardListView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
        itemCount: events.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return EventCardInMap(event: events[index],);
        },
      ),
    );
  }
}
