import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class UserLocationMarker extends StatelessWidget {
  const UserLocationMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.withOpacity(0.2),
      ),
      child: Center(
        child: Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(color: AppColors.white, width: 2),
            boxShadow: AppShadows.button,
          ),
        ),
      ),
    );
  }
}