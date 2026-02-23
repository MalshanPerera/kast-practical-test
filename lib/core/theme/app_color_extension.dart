import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  const AppColorExtension({
    required this.cardGradientStart,
    required this.cardGradientEnd,
    required this.success,
    required this.error,
    required this.warning,
    required this.info,
    required this.textSecondary,
    required this.textHint,
    required this.divider,
  });

  final Color cardGradientStart;
  final Color cardGradientEnd;
  final Color success;
  final Color error;
  final Color warning;
  final Color info;
  final Color textSecondary;
  final Color textHint;
  final Color divider;

  static const AppColorExtension light = AppColorExtension(
    cardGradientStart: AppColors.cardGradientStart,
    cardGradientEnd: AppColors.cardGradientEnd,
    success: AppColors.success,
    error: AppColors.error,
    warning: AppColors.warning,
    info: AppColors.info,
    textSecondary: AppColors.textSecondary,
    textHint: AppColors.textHint,
    divider: AppColors.divider,
  );

  @override
  AppColorExtension copyWith({
    Color? cardGradientStart,
    Color? cardGradientEnd,
    Color? success,
    Color? error,
    Color? warning,
    Color? info,
    Color? textSecondary,
    Color? textHint,
    Color? divider,
  }) {
    return AppColorExtension(
      cardGradientStart: cardGradientStart ?? this.cardGradientStart,
      cardGradientEnd: cardGradientEnd ?? this.cardGradientEnd,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      textSecondary: textSecondary ?? this.textSecondary,
      textHint: textHint ?? this.textHint,
      divider: divider ?? this.divider,
    );
  }

  @override
  AppColorExtension lerp(ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) return this;
    return AppColorExtension(
      cardGradientStart: Color.lerp(cardGradientStart, other.cardGradientStart, t)!,
      cardGradientEnd: Color.lerp(cardGradientEnd, other.cardGradientEnd, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textHint: Color.lerp(textHint, other.textHint, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
    );
  }
}
