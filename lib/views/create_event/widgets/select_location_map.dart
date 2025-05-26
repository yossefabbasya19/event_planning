import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/provider/map_provider/pick_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class SelectLocationMap extends StatefulWidget {
  final PickLocation provider;

  const SelectLocationMap({super.key, required this.provider});

  @override
  State<SelectLocationMap> createState() => _SelectLocationMapState();
}

class _SelectLocationMapState extends State<SelectLocationMap> {
  @override
  void initState() {
    // TODO: implement initState
    widget.provider.getLocation(context);
  }
  @override
  Widget build(BuildContext context) {
    PickLocation provider = widget.provider;
    return Scaffold(
      body: Consumer<PickLocation>(
        builder: (context, value, child) =>  Column(
          children: [
            Expanded(
              child: GoogleMap(
                onMapCreated: (controller) {
                  value.googleMapController = controller;
                },
                onTap: (argument) {
                  value.onTapInMap(argument);
                  Navigator.pop(context);
                },
                markers: value.marker,
                initialCameraPosition: value.cameraPosition,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              alignment: Alignment.center,
              color: ColorsManager.blue,
              width: double.infinity,
              child: Text(
                "Tap on Location To Select",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
