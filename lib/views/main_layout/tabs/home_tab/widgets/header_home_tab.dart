import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/common_function/get_location_address.dart';
import 'package:evently_plan/core/provider/map_provider/pick_location.dart';
import 'package:evently_plan/core/widgets/tab_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HeaderHomeTab extends StatefulWidget {
  final String userName;
  final PickLocation provider;
  final void Function(int) onTap;
  final int selectTab;

  const HeaderHomeTab({
    super.key,
    required this.userName,
    required this.provider,
    required this.onTap,
    required this.selectTab,
  });

  @override
  State<HeaderHomeTab> createState() => _HeaderHomeTabState();
}

class _HeaderHomeTabState extends State<HeaderHomeTab> {
  String address = '';

  @override
  void initState() {
    setAddress();
    super.initState();
  }

  void setAddress() async {
    await widget.provider.getLocation(context);
    getLocationAddress(
      LatLng(
        widget.provider.currentLocation!.latitude!,
        widget.provider.currentLocation!.longitude!,
      ),
    ).then((value) {
      address = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Category> category = getcategorys(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
              child: Text(
                AppLocalizations.of(context)!.helloWorld,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
              child: Text(
                widget.userName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_on_outlined, color: ColorsManager.white),
                  Text(address, style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            CustomTabBarController(
              categorysList: category,
              selectColorBG: Theme.of(context).indicatorColor,
              selectColorFont: Theme.of(context).focusColor,
              unselectColorBG: Colors.transparent,
              unselectColorFont: ColorsManager.white,
              onTap: widget.onTap,
              selectTabIndex: widget.selectTab,
            ),
          ],
        ),
      ),
    );
  }
}
