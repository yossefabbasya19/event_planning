import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/common_function/get_location_address.dart';
import 'package:evently_plan/core/provider/map_provider/pick_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class EventCardInMap extends StatefulWidget {
  final EventDm event;

  const EventCardInMap({super.key, required this.event});

  @override
  State<EventCardInMap> createState() => _EventCardInMapState();
}

class _EventCardInMapState extends State<EventCardInMap> {
  String address = '';

  @override
  void initState() {
    getLocationAddress(LatLng(widget.event.lat!, widget.event.lng!)).then((
      value,
    ) {
      address = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PickLocation provider = Provider.of<PickLocation>(context);
    return address == ''
        ? Center(child: CircularProgressIndicator(color: ColorsManager.blue))
        : GestureDetector(
          onTap: () async{
            await provider.changeInMap(widget.event.lat!, widget.event.lng!);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 33),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: ColorsManager.white,
                border: Border.all(color: ColorsManager.blue),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 138 / 78,
                      child: Image(
                        image: AssetImage(widget.event.category.imagePath),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            widget.event.title,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: ColorsManager.black,
                              ),
                              Expanded(
                                child: FittedBox(
                                  child: Text(
                                    address,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
