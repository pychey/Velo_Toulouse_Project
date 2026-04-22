import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../states/station_state.dart';
import '../../states/user_location_state.dart';
import 'view_model/station_detail_view_model.dart';
import 'widgets/station_detail_content.dart';

class StationDetailScreen extends StatelessWidget {
  const StationDetailScreen({super.key, required this.stationId});

  final String stationId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StationDetailViewModel(
        stationId: stationId,
        stationState: context.read<StationState>(),
        userLocationState: context.read<UserLocationState>(),
      ),
      child: const StationDetailContent(),
    );
  }
}