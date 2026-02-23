import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
        backgroundColor: colors.surfaceContainerHighest,
        foregroundColor: colors.onSurface,
      ),
      body: Padding(
        padding: responsivePadding(context),
        child: Center(
          child: Text(
            '${AppStrings.settings}${AppStrings.toBeImplemented}',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
