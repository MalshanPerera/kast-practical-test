import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/responsive.dart';

class MessagesTab extends StatelessWidget {
  const MessagesTab({super.key});

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
                AppStrings.messages,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: colors.onSurface,
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  AppStrings.noMessagesYet,
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
