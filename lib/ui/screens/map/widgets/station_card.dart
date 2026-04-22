import 'package:flutter/material.dart';
import '../../../../model/station/station.dart';
import '../../../theme/theme.dart';

class StationCard extends StatelessWidget {
  const StationCard({
    super.key,
    required this.station,
    required this.distance,
    required this.isSelected,
    required this.onSelect,
    required this.onNavigate,
  });

  final Station station;
  final String distance;
  final bool isSelected;
  final VoidCallback onSelect;
  final VoidCallback onNavigate;

  @override
  Widget build(BuildContext context) {
    final hasBikes = station.hasAvailableBikes;

    final bgColor = !hasBikes
        ? AppColors.grayBackground
        : (isSelected ? AppColors.brandLightest : AppColors.white);

    final borderColor = !hasBikes
        ? Colors.transparent
        : (isSelected ? AppColors.brandSecondary : AppColors.border);

    final iconBgColor = hasBikes ? AppColors.brandLight : AppColors.grayLight;
    final iconColor = hasBikes ? AppColors.brandPrimary : AppColors.textDisabled;
    final nameColor = hasBikes ? AppColors.textDark : AppColors.textDisabled;
    final subtitleColor = hasBikes ? AppColors.textLight : AppColors.textDisabled;
    final distanceColor = hasBikes ? AppColors.textDark : AppColors.textDisabled;

    return GestureDetector(
      onTap: hasBikes ? onSelect : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(AppRadius.iconContainer),
              ),
              child: Icon(Icons.location_on_outlined, size: 20, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station.name,
                    style: AppTextStyles.bodySmSemibold.copyWith(color: nameColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.directions_bike, size: 14, color: subtitleColor),
                      const SizedBox(width: 4),
                      Text(
                        '${station.availableBikes} Bikes Available',
                        style: AppTextStyles.bodyXs.copyWith(color: subtitleColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  distance,
                  style: AppTextStyles.bodySmSemibold.copyWith(color: distanceColor),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: (hasBikes && isSelected) ? onNavigate : null,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: (hasBikes && isSelected)
                          ? AppColors.brandPrimary
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: (hasBikes && isSelected)
                          ? AppColors.white
                          : (hasBikes ? AppColors.textLight : AppColors.textDisabled),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}