import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';
import '../../confirmation/confirmation_screen.dart';
import '../view_model/station_detail_view_model.dart';
import 'bike_slot_tile.dart';
import 'station_map_background.dart';

class StationDetailContent extends StatelessWidget {
  const StationDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<StationDetailViewModel>();
    final station = vm.station;

    if (station == null) {
      return const Scaffold(
        body: Center(child: Text('Station not found')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final sheetHeight = constraints.maxHeight * 0.7;
          final mapHeight = constraints.maxHeight - sheetHeight;

          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: mapHeight,
                child: StationMapBackground(location: station.location),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: sheetHeight,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.sheet),
                      topRight: Radius.circular(AppRadius.sheet),
                    ),
                    border: Border(
                      top: BorderSide(color: AppColors.border),
                      left: BorderSide(color: AppColors.border),
                      right: BorderSide(color: AppColors.border),
                    ),
                    boxShadow: AppShadows.sheet,
                  ),
                  child: Column(
                    children: [
                      Padding(
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(station.name, style: AppTextStyles.headingLg),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 14,
                                        color: AppColors.textLight,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          station.address,
                                          style: AppTextStyles.bodyXs,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (vm.formattedDistance.isNotEmpty)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.brandLighter,
                                  borderRadius: BorderRadius.circular(AppRadius.badge),
                                ),
                                child: Text(
                                  vm.formattedDistance,
                                  style: AppTextStyles.bodyXsMedium.copyWith(
                                    color: AppColors.brandDark,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: _StatCard(
                                    value: '${vm.availableCount}',
                                    label: 'Available',
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: _StatCard(
                                    value: '${vm.totalCount}',
                                    label: 'Total Bikes',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bikes at this station',
                                  style: AppTextStyles.bodySmSemibold,
                                ),
                                Text(
                                  '${vm.totalCount} total',
                                  style: AppTextStyles.bodyXs,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            ...vm.slots.map(
                              (slot) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: BikeSlotTile(
                                  slot: slot,
                                  onReserve: () => _onReserve(context, slot.id),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _BackButton(onTap: () => Navigator.pop(context)),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onReserve(BuildContext context, String slotId) {
    final vm = context.read<StationDetailViewModel>();
    final station = vm.station;
    if (station == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ConfirmationScreen(
          stationId: station.id,
          slotId: slotId,
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.grayLight,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: AppTextStyles.headingMd),
          const SizedBox(height: 4),
          Text(label, style: AppTextStyles.bodyXs),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          boxShadow: AppShadows.button,
        ),
        child: const Icon(Icons.arrow_back, size: 20, color: AppColors.textDark),
      ),
    );
  }
}