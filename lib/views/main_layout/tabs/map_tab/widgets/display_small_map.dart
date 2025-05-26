import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DisplaySmallMap extends StatelessWidget {
  final EventDm eventDm;
  const DisplaySmallMap({super.key, required this.eventDm});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ColorsManager.blue)),
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.terrain,
              markers: {
                Marker(
                  markerId: MarkerId("!"),
                  position: LatLng(
                   eventDm.lat!,
                   eventDm.lng!,
                  ),
                ),
              },
              initialCameraPosition: CameraPosition(
                zoom: 14,
                target: LatLng(eventDm.lat!, eventDm.lng!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
