import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.notifications),
        backgroundColor: colors.surfaceContainerHighest,
        foregroundColor: colors.onSurface,
      ),
      body: Padding(
        padding: responsivePadding(context),
        child: Center(
          child: Text(
            '${AppStrings.notifications}${AppStrings.toBeImplemented}',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
