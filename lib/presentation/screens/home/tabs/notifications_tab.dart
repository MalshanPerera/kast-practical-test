import 'package:flutter/material.dart';

import '../../../../core/constants/responsive.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      color: colors.surfaceContainerHighest,
      child: SafeArea(
        child: Padding(
          padding: responsivePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Notifications',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: colors.onSurface,
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  'No notifications',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colors.outline,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
