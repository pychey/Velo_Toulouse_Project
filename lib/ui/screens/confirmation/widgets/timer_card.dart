import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';
import '../view_model/confirmation_view_model.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ConfirmationViewModel>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.access_time,
                size: 16,
                color: AppColors.borderLight,
              ),
              const SizedBox(width: 4),
              Text(
                'Hold Time Remaining',
                style: AppTextStyles.bodyXs.copyWith(color: AppColors.borderLight),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            vm.formattedTime,
            style: AppTextStyles.displayLg.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: vm.progress,
              minHeight: 8,
              backgroundColor: AppColors.grayLight,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.brandSecondary),
            ),
          ),
        ],
      ),
    );
  }
}