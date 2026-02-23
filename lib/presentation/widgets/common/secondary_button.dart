import 'package:flutter/material.dart';
import 'package:test_project/core/constants/app_colors.dart';
import 'package:test_project/core/constants/app_dimensions.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.label,
    this.icon,
    required this.onPressed,
  }) : assert(
         label != null || icon != null,
         'Either label or icon must be provided',
       );

  final String? label;
  final IconData? icon;
  final VoidCallback onPressed;

  static final _style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryLight,
    foregroundColor: AppColors.primary,
    minimumSize: const Size.fromHeight(AppDimensions.buttonHeight),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
    ),
    elevation: 0,
    shadowColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    if (icon != null && (label == null || label!.isEmpty)) {
      return SizedBox(
        width: AppDimensions.avatarSize,
        height: AppDimensions.avatarSize,
        child: ElevatedButton(
          style: _style.copyWith(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all(Size.zero),
          ),
          onPressed: onPressed,
          child: Icon(icon, size: AppDimensions.iconSizeMd),
        ),
      );
    }
    return SizedBox(
      height: AppDimensions.buttonHeight,
      child: ElevatedButton(
        style: _style,
        onPressed: onPressed,
        child: Text(label!),
      ),
    );
  }
}
