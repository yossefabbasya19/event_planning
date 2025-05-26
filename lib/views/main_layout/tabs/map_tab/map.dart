import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:evently_plan/core/provider/map_provider/pick_location.dart';
import 'package:evently_plan/views/main_layout/tabs/map_tab/widgets/event_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapTap extends StatelessWidget {
  const MapTap({super.key});

  @override
  Widget build(BuildContext context) {
    PickLocation provider = Provider.of<PickLocation>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: FloatingActionButton(
          backgroundColor: ColorsManager.blue,
          onPressed: () async {
            await provider.getLocation(context);
          },
          child: Icon(Icons.gps_fixed),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseService.getDataRealTime(context, '0'),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: GoogleMap(
                        zoomControlsEnabled: false,
                        onMapCreated: (controller) {
                          provider.googleMapController = controller;
                        },
                        initialCameraPosition: provider.cameraPosition,
                        markers: provider.marker,
                      ),
                    ),
                  ],
                ),
                EventCardListView(events: snapShot.data!)
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
