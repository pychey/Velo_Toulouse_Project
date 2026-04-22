import 'package:latlong2/latlong.dart';
import '../bike_slot/bike_slot.dart';

class Station {
  final String id;
  final String name;
  final String address;
  final LatLng location;
  final List<BikeSlot> bikeSlots;

  Station({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
    required this.bikeSlots,
  });

  int get totalBikes => bikeSlots.length;

  int get availableBikes =>
      bikeSlots.where((s) => s.status == BikeSlotStatus.available).length;

  bool get hasAvailableBikes => availableBikes > 0;

  Station copyWith({
    String? id,
    String? name,
    String? address,
    LatLng? location,
    List<BikeSlot>? bikeSlots,
  }) {
    return Station(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      location: location ?? this.location,
      bikeSlots: bikeSlots ?? this.bikeSlots,
    );
  }
}