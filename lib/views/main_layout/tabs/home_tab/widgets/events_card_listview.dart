import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/widgets/event_details_card.dart';
import 'package:flutter/material.dart';

class EventsCardListview extends StatelessWidget {
  const EventsCardListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return EventDetailsCard(
                eventDm: EventDm(
                  title: "title",
                  description: "description",
                  category: "category",
                  eventDate: DateTime.now(),
                  eventTime: DateTime.now(),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
