import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CelebrationCard extends StatelessWidget {
  const CelebrationCard({
    super.key,
    required this.title,
    required this.total,
    required this.buttonLabel,
    required this.colors,
  });

  final String title;
  final int total;
  final String buttonLabel;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 22,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.auto_awesome_rounded,
                color: AppColors.primary,
                size: 18,
              ),
              const SizedBox(width: 7),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
              const SizedBox(width: 7),
              const Icon(
                Icons.auto_awesome_rounded,
                color: AppColors.primary,
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 48,
            width: 112,
            child: Stack(
              alignment: Alignment.center,
              children: [
                for (var i = 0; i < colors.length; i++)
                  Positioned(
                    left: 14.0 + (i * 24),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: colors[i],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                        size: 23,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Total | $total',
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.cake_rounded, size: 18),
              label: Text(buttonLabel),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
