import 'package:latlong2/latlong.dart';
import '../../../model/bike_slot/bike_slot.dart';
import '../../../model/station/station.dart';
import 'station_repository.dart';

class StationRepositoryMock implements StationRepository {
  static final LatLng _userLocation = LatLng(11.5601, 104.9230);

  final List<Station> _stations = [
    Station(
      id: 'st_01',
      name: 'Riverside Plaza',
      address: 'Sisowath Quay, Phnom Penh',
      location: LatLng(11.5625, 104.9310),
      bikeSlots: [
        BikeSlot(id: 'st_01_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_01_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_01_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_01_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_01_s5', slotNumber: 'Slot 05', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_01_s6', slotNumber: 'Slot 06', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_01_s7', slotNumber: 'Slot 07', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_01_s8', slotNumber: 'Slot 08', status: BikeSlotStatus.unavailable),
      ],
    ),
    Station(
      id: 'st_02',
      name: 'Central Market',
      address: 'Kampuchea Krom Blvd, Phnom Penh',
      location: LatLng(11.5697, 104.9211),
      bikeSlots: [
        BikeSlot(id: 'st_02_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_02_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_02_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_02_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_02_s5', slotNumber: 'Slot 05', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_02_s6', slotNumber: 'Slot 06', status: BikeSlotStatus.available),
      ],
    ),
    Station(
      id: 'st_03',
      name: 'Royal Palace',
      address: 'Samdach Sothearos Blvd, Phnom Penh',
      location: LatLng(11.5640, 104.9314),
      bikeSlots: [
        BikeSlot(id: 'st_03_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_03_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_03_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_03_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_03_s5', slotNumber: 'Slot 05', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_03_s6', slotNumber: 'Slot 06', status: BikeSlotStatus.available),
      ],
    ),
    Station(
      id: 'st_04',
      name: 'Wat Phnom',
      address: 'Street 94, Phnom Penh',
      location: LatLng(11.5764, 104.9222),
      bikeSlots: [
        BikeSlot(id: 'st_04_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_04_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_04_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_04_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_04_s5', slotNumber: 'Slot 05', status: BikeSlotStatus.unavailable),
      ],
    ),
    Station(
      id: 'st_05',
      name: 'Independence Monument',
      address: 'Norodom Blvd, Phnom Penh',
      location: LatLng(11.5564, 104.9282),
      bikeSlots: [
        BikeSlot(id: 'st_05_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_05_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_05_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_05_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.unavailable),
      ],
    ),
    Station(
      id: 'st_06',
      name: 'Olympic Stadium',
      address: 'Street 199, Phnom Penh',
      location: LatLng(11.5545, 104.9150),
      bikeSlots: [
        BikeSlot(id: 'st_06_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_06_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_06_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_06_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_06_s5', slotNumber: 'Slot 05', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_06_s6', slotNumber: 'Slot 06', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_06_s7', slotNumber: 'Slot 07', status: BikeSlotStatus.available),
      ],
    ),
    Station(
      id: 'st_07',
      name: 'Aeon Mall Sen Sok',
      address: 'Street 1003, Phnom Penh',
      location: LatLng(11.5897, 104.9015),
      bikeSlots: [
        BikeSlot(id: 'st_07_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_07_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_07_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_07_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_07_s5', slotNumber: 'Slot 05', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_07_s6', slotNumber: 'Slot 06', status: BikeSlotStatus.available),
      ],
    ),
    Station(
      id: 'st_08',
      name: 'Russian Market',
      address: 'Street 163, Phnom Penh',
      location: LatLng(11.5434, 104.9228),
      bikeSlots: [
        BikeSlot(id: 'st_08_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_08_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_08_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_08_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_08_s5', slotNumber: 'Slot 05', status: BikeSlotStatus.available),
      ],
    ),
    Station(
      id: 'st_09',
      name: 'Koh Pich Bridge',
      address: 'Diamond Island, Phnom Penh',
      location: LatLng(11.5490, 104.9358),
      bikeSlots: [
        BikeSlot(id: 'st_09_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_09_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_09_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_09_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.unavailable),
      ],
    ),
    Station(
      id: 'st_10',
      name: 'Toul Sleng Museum',
      address: 'Street 113, Phnom Penh',
      location: LatLng(11.5497, 104.9178),
      bikeSlots: [
        BikeSlot(id: 'st_10_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_10_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_10_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_10_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_10_s5', slotNumber: 'Slot 05', status: BikeSlotStatus.unavailable),
      ],
    ),
    Station(
      id: 'st_11',
      name: 'Phsar Thmei Station',
      address: 'Street 130, Phnom Penh',
      location: LatLng(11.5685, 104.9247),
      bikeSlots: [
        BikeSlot(id: 'st_11_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_11_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_11_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_11_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_11_s5', slotNumber: 'Slot 05', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_11_s6', slotNumber: 'Slot 06', status: BikeSlotStatus.unavailable),
      ],
    ),
    Station(
      id: 'st_12',
      name: 'BKK1 District',
      address: 'Street 57, Phnom Penh',
      location: LatLng(11.5512, 104.9260),
      bikeSlots: [
        BikeSlot(id: 'st_12_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_12_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_12_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_12_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_12_s5', slotNumber: 'Slot 05', status: BikeSlotStatus.unavailable),
      ],
    ),
    Station(
      id: 'st_13',
      name: 'Chroy Changvar',
      address: 'National Road 6A, Phnom Penh',
      location: LatLng(11.5820, 104.9400),
      bikeSlots: [
        BikeSlot(id: 'st_13_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_13_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_13_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_13_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.unavailable),
      ],
    ),
    Station(
      id: 'st_14',
      name: 'Night Market',
      address: 'Preah Sisowath Quay, Phnom Penh',
      location: LatLng(11.5708, 104.9275),
      bikeSlots: [
        BikeSlot(id: 'st_14_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_14_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_14_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.unavailable),
      ],
    ),
    Station(
      id: 'st_15',
      name: 'Orussey Market',
      address: 'Street 182, Phnom Penh',
      location: LatLng(11.5618, 104.9170),
      bikeSlots: [
        BikeSlot(id: 'st_15_s1', slotNumber: 'Slot 01', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_15_s2', slotNumber: 'Slot 02', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_15_s3', slotNumber: 'Slot 03', status: BikeSlotStatus.unavailable),
        BikeSlot(id: 'st_15_s4', slotNumber: 'Slot 04', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_15_s5', slotNumber: 'Slot 05', status: BikeSlotStatus.available),
        BikeSlot(id: 'st_15_s6', slotNumber: 'Slot 06', status: BikeSlotStatus.unavailable),
      ],
    ),
  ];

  @override
  Future<List<Station>> fetchStations() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _stations;
  }

  @override
  Future<Station?> fetchStationById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _stations.firstWhere(
      (s) => s.id == id,
      orElse: () => throw Exception('Station not found: $id'),
    );
  }

  @override
  Future<LatLng> fetchUserLocation() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _userLocation;
  }
}