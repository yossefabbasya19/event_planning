import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:evently_plan/core/my_router/my_router.dart';
import 'package:flutter/material.dart';

class CustomAppBarForEventDetails extends StatelessWidget {
  final EventDm eventDm;
  final bool isMyEvent;
  const CustomAppBarForEventDetails({super.key, required this.isMyEvent, required this.eventDm});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          color: ColorsManager.blue,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FittedBox(
          child: Text(
            "events Details",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        isMyEvent?Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: ColorsManager.blue,
              onPressed: () {
                Navigator.pushNamed(context, MyRouter.eventEdit,arguments: eventDm);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_outline_outlined),
              color: ColorsManager.red,
              onPressed: ()async{
                await FirebaseService.deleteSelectEvent(eventDm.eventID, context);
                Navigator.pop(context);
              },
            ),
          ],
        ):SizedBox(),
      ],
    );
  }
}
