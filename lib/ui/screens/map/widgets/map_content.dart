import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../../../../model/generic/async_value.dart';
import '../../../theme/theme.dart';
import '../view_model/map_view_model.dart';
import 'search_bar_widget.dart';
import 'station_marker.dart';
import 'stations_bottom_sheet.dart';
import 'user_location_marker.dart';

class MapContent extends StatefulWidget {
  const MapContent({super.key});

  @override
  State<MapContent> createState() => _MapContentState();
}

class _MapContentState extends State<MapContent> {
  final MapController _mapController = MapController();

  static const LatLng _defaultCenter = LatLng(11.5625, 104.9280);
  static const double _defaultZoom = 14.0;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MapViewModel>();
    final async = vm.stationState.stationsAsync;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          switch (async.state) {
            AsyncState.loading => const Center(
                child: CircularProgressIndicator(color: AppColors.brandPrimary),
              ),
            AsyncState.error => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Error: ${async.error}',
                    style: AppTextStyles.bodySm,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            AsyncState.success => _buildMap(context, vm),
          },
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SearchBarWidget(
                initialValue: vm.searchQuery,
                onSubmit: vm.submitSearch,
              ),
            ),
          ),
          if (vm.isSheetOpen) StationsBottomSheet(vm: vm),
        ],
      ),
    );
  }

  Widget _buildMap(BuildContext context, MapViewModel vm) {
    final markers = <Marker>[];

    for (final station in vm.allStations) {
      markers.add(
        Marker(
          point: station.location,
          width: 56,
          height: 56,
          child: StationMarker(
            station: station,
            isSelected: vm.isSelected(station.id),
            onTap: () => vm.selectStationFromMap(station.id),
          ),
        ),
      );
    }

    if (vm.userLocation != null) {
      markers.add(
        Marker(
          point: vm.userLocation!,
          width: 28,
          height: 28,
          child: const UserLocationMarker(),
        ),
      );
    }

    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: vm.userLocation ?? _defaultCenter,
        initialZoom: _defaultZoom,
        minZoom: 10,
        maxZoom: 18,
        onTap: (_, __) => vm.closeSheet(),
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.velotoulouse.app',
        ),
        if (vm.routePath.length == 2)
          PolylineLayer(
            polylines: [
              Polyline(
                points: vm.routePath,
                strokeWidth: 5,
                color: AppColors.brandPrimary,
                borderStrokeWidth: 1,
                borderColor: AppColors.brandDark,
              ),
            ],
          ),
        MarkerLayer(markers: markers),
      ],
    );
  }
}