import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import '../../../../model/bike_slot/bike_slot.dart';
import '../../../../model/station/station.dart';
import '../../../states/station_state.dart';
import '../../../states/user_location_state.dart';

class StationDetailViewModel extends ChangeNotifier {
  final String stationId;
  final StationState stationState;
  final UserLocationState userLocationState;

  StationDetailViewModel({
    required this.stationId,
    required this.stationState,
    required this.userLocationState,
  }) {
    stationState.addListener(notifyListeners);
    userLocationState.addListener(notifyListeners);
  }

  @override
  void dispose() {
    stationState.removeListener(notifyListeners);
    userLocationState.removeListener(notifyListeners);
    super.dispose();
  }

  Station? get station => stationState.getStationById(stationId);

  List<BikeSlot> get slots => station?.bikeSlots ?? [];

  int get availableCount => station?.availableBikes ?? 0;

  int get totalCount => station?.totalBikes ?? 0;

  LatLng? get userLocation => userLocationState.location;

  String get formattedDistance {
    final s = station;
    final user = userLocation;
    if (s == null || user == null) return '';
    final meters = const Distance()(user, s.location);
    if (meters < 1000) return '${meters.round()} m';
    return '${(meters / 1000).toStringAsFixed(1)} km';
  }

  void reserveSlot(String slotId) {
    stationState.reserveBike(stationId, slotId);
  }
}