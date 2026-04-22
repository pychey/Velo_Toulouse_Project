import 'package:latlong2/latlong.dart';
import '../../../model/station/station.dart';

abstract class StationRepository {
  Future<List<Station>> fetchStations();

  Future<Station?> fetchStationById(String id);

  Future<LatLng> fetchUserLocation();
}