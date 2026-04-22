import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../states/station_state.dart';
import '../../states/user_location_state.dart';
import 'view_model/map_view_model.dart';
import 'widgets/map_content.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapViewModel(
        stationState: context.read<StationState>(),
        userLocationState: context.read<UserLocationState>(),
      ),
      child: const MapContent(),
    );
  }
}