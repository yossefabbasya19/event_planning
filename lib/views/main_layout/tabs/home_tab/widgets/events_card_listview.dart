import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/widgets/event_details_card.dart';
import 'package:flutter/material.dart';

class EventsCardListview extends StatefulWidget {
  final int selectedCategory;

  const EventsCardListview({super.key, required this.selectedCategory});

  @override
  State<EventsCardListview> createState() => _EventsCardListviewState();
}

class _EventsCardListviewState extends State<EventsCardListview> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseService.getDataRealTime(
        context,
        getcategorys(context)[widget.selectedCategory].id,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: snapshot.data!.length,
                    (context, index) {
                      return EventDetailsCard(eventDm: snapshot.data![index]);
                    },
                  ),
                ),
              ],
            ),
          );
        } else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
