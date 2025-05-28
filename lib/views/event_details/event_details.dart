import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/DM/user_DM.dart';
import 'package:evently_plan/core/assets_maneger.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/common_function/get_location_address.dart';
import 'package:evently_plan/core/extintion/date_ex.dart';
import 'package:evently_plan/core/widgets/custom_display_image.dart';
import 'package:evently_plan/views/create_event/widgets/select_location_display.dart';
import 'package:evently_plan/views/event_details/widgets/custom_app_bar_for_event_details.dart';
import 'package:evently_plan/views/main_layout/tabs/map_tab/widgets/display_small_map.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetails extends StatefulWidget {
  final EventDm eventDm;

  const EventDetails({super.key, required this.eventDm});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  void initState() {
    getLocationAddress(LatLng(widget.eventDm.lat!, widget.eventDm.lng!)).then((
      value,
    ) {
      address = value;
      setState(() {});
    });
    super.initState();
  }

  String address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBarForEventDetails(
                  eventDm: widget.eventDm,
                  isMyEvent:
                      widget.eventDm.userID == UserDm.currentUser!.userID,
                ),
                CustomDisplayImage(imagePath: widget.eventDm.category.imagePath),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Text(
                    widget.eventDm.title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: ColorsManager.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: CustomWidgetToDisplayInfo(
                    imagePath: AssetsManeger.calenderImage,
                    title: Text(
                      style: Theme.of(context).textTheme.labelMedium,
                      widget.eventDm.eventDate.dateFormatedForListTile,
                    ),
                    subTitle:
                        widget.eventDm.eventDate.dateFormatWithHourAndMinutes,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: CustomWidgetToDisplayInfo(
                    imagePath: AssetsManeger.locationLogo,
                    title: Text(
                      style: Theme.of(context).textTheme.labelMedium,
                      address,
                    ),
                  ),
                ),
                DisplaySmallMap(eventDm: widget.eventDm),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Description",style: Theme.of(context).textTheme.displayMedium,),
                      SizedBox(height: 8,),
                      Text(widget.eventDm.description,style: Theme.of(context).textTheme.displayMedium,),
                    ],
                  ),
                ),
                SizedBox(height: 16,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
