import 'package:evently_plan/core/extintion/date_ex.dart';
import 'package:flutter/material.dart';

class DisplayDatetimeCard extends StatelessWidget {
  const DisplayDatetimeCard({super.key, required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:4),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "${dateTime.day}",
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(fontSize: 20),
              ),
              Text(dateTime.getMonthName, style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ),
      ),
    );
  }
}
