enum BikeSlotStatus {
  available,
  unavailable,
}

class BikeSlot {
  final String id;
  final String slotNumber;
  final BikeSlotStatus status;

  BikeSlot({
    required this.id,
    required this.slotNumber,
    required this.status,
  });

  BikeSlot copyWith({
    String? id,
    String? slotNumber,
    BikeSlotStatus? status,
  }) {
    return BikeSlot(
      id: id ?? this.id,
      slotNumber: slotNumber ?? this.slotNumber,
      status: status ?? this.status,
    );
  }
}