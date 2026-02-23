import 'package:flutter/material.dart';

class NavFab extends StatelessWidget {
  const NavFab({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Material(
      color: colors.primary,
      shape: const CircleBorder(),
      elevation: 4,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 56,
          height: 56,
          child: Icon(
            Icons.credit_card_outlined,
            color: colors.onPrimary,
            size: 28,
          ),
        ),
      ),
    );
  }
}
