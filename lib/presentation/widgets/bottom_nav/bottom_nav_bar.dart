import 'package:flutter/material.dart';

import 'nav_icon.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.selectedIndex,
    this.onItemSelected,
    this.onFabTap,
  });

  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;
  final VoidCallback? onFabTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return BottomAppBar(
      padding: EdgeInsets.zero,
      surfaceTintColor: Colors.transparent,
      color: colors.surface,
      shape: const CircularNotchedRectangle(),
      elevation: 0,
      notchMargin: 12,
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.dashboard_outlined,
              selected: selectedIndex == 0,
              onTap: () => onItemSelected?.call(0),
            ),
            _NavItem(
              icon: Icons.chat_bubble_outline,
              selected: selectedIndex == 1,
              onTap: () => onItemSelected?.call(1),
            ),
            const SizedBox(width: 64),
            _NavItem(
              icon: Icons.notifications_outlined,
              selected: selectedIndex == 2,
              onTap: () => onItemSelected?.call(2),
            ),
            _NavItem(
              icon: Icons.person_outline,
              selected: selectedIndex == 3,
              onTap: () => onItemSelected?.call(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: NavIcon(icon: icon, selected: selected),
    );
  }
}
