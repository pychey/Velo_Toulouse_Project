import 'package:flutter/foundation.dart';
import '../../data/repositories/station/station_repository.dart';
import '../../model/generic/async_value.dart';
import '../../model/bike_slot/bike_slot.dart';
import '../../model/station/station.dart';

class StationState extends ChangeNotifier {
  final StationRepository repository;

  AsyncValue<List<Station>> _stationsAsync = AsyncValue.loading();

  StationState({required this.repository}) {
    _init();
  }

  AsyncValue<List<Station>> get stationsAsync => _stationsAsync;

  List<Station> get stations => _stationsAsync.data ?? [];

  Station? getStationById(String id) {
    try {
      return stations.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> _init() async {
    try {
      final result = await repository.fetchStations();
      _stationsAsync = AsyncValue.success(result);
    } catch (e) {
      _stationsAsync = AsyncValue.error(e);
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    _stationsAsync = AsyncValue.loading();
    notifyListeners();
    await _init();
  }

  void reserveBike(String stationId, String slotId) {
    final current = _stationsAsync.data;
    if (current == null) return;

    final updated = current.map((station) {
      if (station.id != stationId) return station;

      final updatedSlots = station.bikeSlots.map((slot) {
        if (slot.id != slotId) return slot;
        return slot.copyWith(status: BikeSlotStatus.unavailable);
      }).toList();

      return station.copyWith(bikeSlots: updatedSlots);
    }).toList();

    _stationsAsync = AsyncValue.success(updated);
    notifyListeners();
  }

  BikeSlot? getSlot(String stationId, String slotId) {
    final station = getStationById(stationId);
    if (station == null) return null;
    try {
      return station.bikeSlots.firstWhere((s) => s.id == slotId);
    } catch (_) {
      return null;
    }
  }
}