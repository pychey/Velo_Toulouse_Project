import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import '../../../../model/station/station.dart';
import '../../../states/station_state.dart';
import '../../../states/user_location_state.dart';

class MapViewModel extends ChangeNotifier {
  final StationState stationState;
  final UserLocationState userLocationState;

  String? _selectedStationId;
  String _searchQuery = '';
  bool _isSheetOpen = false;
  bool _isSearchMode = false;
  List<Station>? _sheetStationsSnapshot;

  MapViewModel({
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

  String? get selectedStationId => _selectedStationId;
  String get searchQuery => _searchQuery;
  bool get isSheetOpen => _isSheetOpen;
  bool get isSearchMode => _isSearchMode;

  LatLng? get userLocation => userLocationState.location;

  List<Station> get allStations => stationState.stations;

  Station? get selectedStation {
    if (_selectedStationId == null) return null;
    return stationState.getStationById(_selectedStationId!);
  }

  List<Station> get stationsSortedByDistance {
    final user = userLocation;
    final list = List<Station>.from(allStations);
    if (user == null) return list;

    final distance = const Distance();
    list.sort((a, b) {
      final da = distance(user, a.location);
      final db = distance(user, b.location);
      return da.compareTo(db);
    });
    return list;
  }

  List<Station> get nearbyStations {
    final user = userLocation;
    if (user == null) return stationsSortedByDistance;

    final distance = const Distance();
    return stationsSortedByDistance
        .where((s) => distance(user, s.location) <= 1500)
        .toList();
  }

  List<Station> get sheetStations => _sheetStationsSnapshot ?? [];

  double distanceFromUser(Station station) {
    final user = userLocation;
    if (user == null) return 0;
    return const Distance()(user, station.location);
  }

  String formattedDistance(Station station) {
    final meters = distanceFromUser(station);
    if (meters < 1000) {
      return '${meters.round()} m';
    }
    return '${(meters / 1000).toStringAsFixed(1)} km';
  }

  List<LatLng> get routePath {
    final user = userLocation;
    final station = selectedStation;
    if (user == null || station == null) return [];
    return [user, station.location];
  }

  void selectStationFromMap(String stationId) {
    final station = stationState.getStationById(stationId);
    if (station == null) return;
    if (!station.hasAvailableBikes) return;

    final rest = nearbyStations.where((s) => s.id != stationId).toList();
    _sheetStationsSnapshot = [station, ...rest];

    _selectedStationId = stationId;
    _isSheetOpen = true;
    _isSearchMode = false;
    _searchQuery = '';
    notifyListeners();
  }

  void selectStationFromSheet(String stationId) {
    final station = stationState.getStationById(stationId);
    if (station == null) return;
    if (!station.hasAvailableBikes) return;

    _selectedStationId = stationId;
    notifyListeners();
  }

  void submitSearch(String query) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      closeSheet();
      return;
    }
    _searchQuery = trimmed;
    _isSearchMode = true;
    _isSheetOpen = true;

    final q = trimmed.toLowerCase();
    _sheetStationsSnapshot = nearbyStations
        .where((s) => s.name.toLowerCase().contains(q))
        .toList();

    final matches = _sheetStationsSnapshot!;
    if (matches.isNotEmpty && matches.first.hasAvailableBikes) {
      _selectedStationId = matches.first.id;
    } else {
      _selectedStationId = null;
    }
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void closeSheet() {
    _isSheetOpen = false;
    _selectedStationId = null;
    _searchQuery = '';
    _isSearchMode = false;
    _sheetStationsSnapshot = null;
    notifyListeners();
  }

  bool isSelected(String stationId) => _selectedStationId == stationId;
}