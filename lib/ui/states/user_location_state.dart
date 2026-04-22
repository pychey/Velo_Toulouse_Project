import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import '../../data/repositories/station/station_repository.dart';

class UserLocationState extends ChangeNotifier {
  final StationRepository repository;

  LatLng? _location;

  UserLocationState({required this.repository}) {
    _init();
  }

  LatLng? get location => _location;

  Future<void> _init() async {
    try {
      _location = await repository.fetchUserLocation();
      notifyListeners();
    } catch (_) {
      _location = null;
      notifyListeners();
    }
  }
}