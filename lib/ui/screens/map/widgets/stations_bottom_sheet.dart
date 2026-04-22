import 'package:flutter/material.dart';
import '../../../../model/station/station.dart';
import '../../../theme/theme.dart';
import '../../station_detail/station_detail_screen.dart';
import '../view_model/map_view_model.dart';
import 'station_card.dart';

class StationsBottomSheet extends StatefulWidget {
  const StationsBottomSheet({super.key, required this.vm});

  final MapViewModel vm;

  @override
  State<StationsBottomSheet> createState() => _StationsBottomSheetState();
}

class _StationsBottomSheetState extends State<StationsBottomSheet> {
  final DraggableScrollableController _sheetController = DraggableScrollableController();

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  void _onHandleDragUpdate(DragUpdateDetails details) {
    final screenHeight = MediaQuery.of(context).size.height;
    final delta = -details.delta.dy / screenHeight;
    final newSize = (_sheetController.size + delta).clamp(0.25, 0.9);
    _sheetController.jumpTo(newSize);
  }

  void _onHandleDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    if (velocity > 300) {
      _sheetController.animateTo(
        0.25,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    } else if (velocity < -300) {
      _sheetController.animateTo(
        0.9,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    } else {
      final current = _sheetController.size;
      final target = current > 0.575 ? 0.9 : 0.25;
      _sheetController.animateTo(
        target,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.vm;
    final stations = vm.sheetStations;
    final availableCount = stations.fold<int>(
      0,
      (sum, s) => sum + s.availableBikes,
    );

    return DraggableScrollableSheet(
      controller: _sheetController,
      initialChildSize: 0.45,
      minChildSize: 0.25,
      maxChildSize: 0.9,
      snap: true,
      snapSizes: const [0.25, 0.45, 0.9],
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppRadius.sheet),
              topRight: Radius.circular(AppRadius.sheet),
            ),
            boxShadow: AppShadows.sheet,
          ),
          child: Column(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onVerticalDragUpdate: _onHandleDragUpdate,
                onVerticalDragEnd: _onHandleDragEnd,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    width: 54,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onVerticalDragUpdate: _onHandleDragUpdate,
                onVerticalDragEnd: _onHandleDragEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vm.isSearchMode
                            ? '${stations.length} result${stations.length == 1 ? '' : 's'}'
                            : '${stations.length} stations Nearby',
                        style: AppTextStyles.headingLg,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$availableCount bikes available now',
                        style: AppTextStyles.bodyXs,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: stations.isEmpty
                    ? _buildEmpty()
                    : ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                        itemCount: stations.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final station = stations[index];
                          return StationCard(
                            station: station,
                            distance: vm.formattedDistance(station),
                            isSelected: vm.isSelected(station.id),
                            onSelect: () => vm.selectStationFromSheet(station.id),
                            onNavigate: () => _navigateToDetail(context, station),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'No stations match your search.',
          style: AppTextStyles.bodySm,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, Station station) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => StationDetailScreen(stationId: station.id),
      ),
    );
  }
}