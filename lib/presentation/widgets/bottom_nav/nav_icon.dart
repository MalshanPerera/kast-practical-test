import 'package:flutter/material.dart';

import '../../../core/constants/app_dimensions.dart';

class NavIcon extends StatelessWidget {
  const NavIcon({
    super.key,
    required this.icon,
    this.selected = false,
    this.color,
    this.selectedColor,
  });

  final IconData icon;
  final bool selected;
  final Color? color;
  final Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = selected
        ? (selectedColor ?? theme.colorScheme.primary)
        : (color ?? theme.colorScheme.outline);
    return Icon(icon, size: AppDimensions.iconSizeLg, color: effectiveColor);
  }
}
