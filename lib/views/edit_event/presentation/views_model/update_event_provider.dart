import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/common_function/get_location_address.dart';
import 'package:evently_plan/core/provider/map_provider/pick_location.dart';
import 'package:evently_plan/core/result.dart';
import 'package:evently_plan/views/edit_event/data/repo/edit_event.dart';
import 'package:evently_plan/views/edit_event/presentation/views_model/update_event_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UpdateEventProvider extends ChangeNotifier {
  final EditEvent editEvent;
  PickLocation pickLocation = PickLocation();
  UpdateEventState state = UpdateEventStateInit();

  UpdateEventProvider(this.editEvent);

  Future<void> updateEvent(BuildContext context, EventDm eventDm) async {
    var result = await editEvent.updateEvent(context, eventDm);
    switch (result) {
      case SuccessResult<EventDm>():
        state = UpdateEventStateSuccess(result.data);
        notifyListeners();
      case FailureResult<EventDm>():
        state = UpdateEventStateFailure(fireBaseError: result.failureError);
        notifyListeners();
      case GeneralFailureResult<EventDm>():
        state = UpdateEventStateFailure(generalError: result.failureError);
        notifyListeners();
    }
  }

  String? address;

  Future<void> getInitLocation(BuildContext context, LatLng latlng) async {
    address = await getLocationAddress(latlng);
    notifyListeners();
  }
}
