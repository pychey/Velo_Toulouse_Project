import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';
import '../view_model/confirmation_view_model.dart';


class ConfirmationContent extends StatelessWidget {
  const ConfirmationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ConfirmationViewModel>();
    final station = vm.station;
    final slot = vm.slot;

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          child: Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.successLight,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.successLightest, width: 10),
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  color: AppColors.successBase,
                  size: 28,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Reservation confirmed',
                style: AppTextStyles.displayMd,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'Your bike is being held at the station',
                style: AppTextStyles.bodyXs,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              if (!vm.timerFinished) const Placeholder(),
              if (!vm.timerFinished) const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Reservation details',
                  style: AppTextStyles.bodySmSemibold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  border: Border.all(color: AppColors.border),
                  boxShadow: AppShadows.card,
                ),
                child: Column(
                  children: [
                    _DetailRow(
                      icon: Icons.location_on_outlined,
                      label: 'Station',
                      value: station?.name ?? '-',
                    ),
                    const SizedBox(height: 24),
                    _DetailRow(
                      icon: Icons.tag,
                      label: 'Pickup Slot',
                      value: slot?.slotNumber ?? '-',
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.brandPrimary,
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                    boxShadow: AppShadows.button,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.navigation_outlined,
                        color: AppColors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text('Navigate to Station', style: AppTextStyles.buttonLabel),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.grayLight,
            borderRadius: BorderRadius.circular(AppRadius.iconContainer),
          ),
          child: Icon(icon, size: 20, color: AppColors.textMedium),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.bodyXsMedium,
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTextStyles.bodySmSemibold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}