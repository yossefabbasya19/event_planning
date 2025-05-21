import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/cubit/add_event_to_favorite_list/add_event_to_favorite_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class descriptionCard extends StatefulWidget {
  final bool isInFavoriteList;
  final EventDm event;
  final void Function()? onPressed;

  const descriptionCard({
    super.key,
    required this.event,
    this.onPressed,
    required this.isInFavoriteList,
  });

  @override
  State<descriptionCard> createState() => _descriptionCardState();
}

class _descriptionCardState extends State<descriptionCard> {
  late bool isFavorites;

  @override
  void initState() {
    super.initState();
    isFavorites = widget.isInFavoriteList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      AddAndRemoveEventToFavoriteListCubit,
      AddAndRemoveEventToFavoriteListState
    >(
      listener: (context, state) {
        if (state is AddAndRemoveEventToFavoriteListFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(8),
        ),

        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.event.description,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                isFavorites = !isFavorites;
                if (isFavorites) {
                  BlocProvider.of<AddAndRemoveEventToFavoriteListCubit>(
                    context,
                  ).addEventToFavorites(widget.event.eventID);
                } else {
                  BlocProvider.of<AddAndRemoveEventToFavoriteListCubit>(
                    context,
                  ).removeEventToFavorites(widget.event.eventID);
                }
                setState(() {});
              },
              child: Icon(
                isFavorites ? Icons.favorite : Icons.favorite_border,
                color: ColorsManager.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
