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
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.white, width: 1.5),
                ),
                child: Text(
                  '${station.availableBikes}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}