import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../states/station_state.dart';
import 'view_model/confirmation_view_model.dart';
import 'widgets/confirmation_content.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({
    super.key,
    required this.stationId,
    required this.slotId,
  });

  final String stationId;
  final String slotId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmationViewModel(
        stationId: stationId,
        slotId: slotId,
        stationState: context.read<StationState>(),
      ),
      child: const ConfirmationContent(),
    );
  }
}