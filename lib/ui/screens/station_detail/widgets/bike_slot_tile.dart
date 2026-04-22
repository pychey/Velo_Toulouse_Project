import 'package:flutter/material.dart';
import '../../../../model/bike_slot/bike_slot.dart';
import '../../../theme/theme.dart';

class BikeSlotTile extends StatelessWidget {
  const BikeSlotTile({
    super.key,
    required this.slot,
    required this.onReserve,
  });

  final BikeSlot slot;
  final VoidCallback onReserve;

  @override
  Widget build(BuildContext context) {
    final isAvailable = slot.status == BikeSlotStatus.available;

    final bgColor = isAvailable ? AppColors.brandLightest : AppColors.grayLight;
    final iconBgColor = isAvailable ? AppColors.brandLight : AppColors.border;
    final iconColor = isAvailable ? AppColors.brandPrimary : AppColors.textDisabled;
    final slotNameColor = AppColors.textDark;
    final statusColor = isAvailable ? AppColors.brandPrimary : AppColors.textDisabled;

    final statusLabel = isAvailable ? 'Available' : 'Unavailable';

    final buttonColor = isAvailable ? AppColors.brandPrimary : AppColors.border;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(AppRadius.iconContainer),
            ),
            child: Icon(Icons.directions_bike, size: 20, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  slot.slotNumber,
                  style: AppTextStyles.bodySmSemibold.copyWith(color: slotNameColor),
                ),
                const SizedBox(height: 2),
                Text(
                  statusLabel,
                  style: AppTextStyles.bodyXsMedium.copyWith(color: statusColor),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: isAvailable ? onReserve : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(AppRadius.pill),
                boxShadow: AppShadows.button,
              ),
              child: Text(
                'Reserve',
                style: AppTextStyles.buttonLabelSm,
              ),
            ),
          ),
        ],
      ),
    );
  }
}