import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key, required this.isMobile, required this.onMenuTap});

  final bool isMobile;
  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isMobile)
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(Icons.menu_rounded),
          ),
        const Text(
          'Home',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search_rounded, size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Search',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        if (!isMobile) ...[
          const _NavIcon(Icons.grid_view_rounded),
          const _NavIcon(Icons.notifications_none_rounded),
          const _NavIcon(Icons.history_rounded),
          const SizedBox(width: 8),
        ],
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: Color(0xFFFFC7A8),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person_rounded, color: Colors.white),
        ),
      ],
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Icon(icon, size: 21),
    );
  }
}
