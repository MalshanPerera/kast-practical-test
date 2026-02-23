import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.messages),
        backgroundColor: colors.surfaceContainerHighest,
        foregroundColor: colors.onSurface,
      ),
      body: Padding(
        padding: responsivePadding(context),
        child: Center(
          child: Text(
            '${AppStrings.messages}${AppStrings.toBeImplemented}',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
