import 'package:flutter/material.dart';
import '../../../../model/station/station.dart';
import '../../../theme/theme.dart';

class StationMarker extends StatelessWidget {
  const StationMarker({
    super.key,
    required this.station,
    required this.isSelected,
    required this.onTap,
  });

  final Station station;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasBikes = station.hasAvailableBikes;
    final bgColor = hasBikes
        ? (isSelected ? AppColors.brandPrimary : AppColors.brandLight)
        : AppColors.grayLight;
    final iconColor = hasBikes
        ? (isSelected ? AppColors.white : AppColors.brandPrimary)
        : AppColors.textDisabled;
    final badgeColor = hasBikes ? AppColors.brandPrimary : AppColors.textDisabled;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 56,
        height: 56,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 2),
                  boxShadow: AppShadows.button,
                ),
                child: Icon(
                  Icons.directions_bike,
                  size: 20,
                  color: iconColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}