import 'package:evently_plan/core/colors_maneger.dart';
import 'package:flutter/material.dart';

class descriptionCard extends StatelessWidget {
  final String description;
  final void Function()? onPressed;

  const descriptionCard({super.key, required this.description, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Row(
        children: [
          Expanded(
            child: Text(
              description,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Icon(Icons.favorite_border, color: ColorsManager.blue),
          ),
        ],
      ),
    );
  }
}
