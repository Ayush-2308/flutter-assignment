import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 760;
    return Container(
      constraints: const BoxConstraints(minHeight: 230),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.heroStart, AppColors.heroEnd],
        ),
        boxShadow: _shadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: .35),
                    ),
                  ),
                  child: const Text(
                    'ETHEREUM 2.0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Top Rating Project',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Trending project and high rating\nProject Created by team.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: .76),
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 22),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.white.withValues(alpha: .8),
                    ),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                  child: const Text('Learn More.'),
                ),
              ],
            ),
          ),
          if (!compact) const SizedBox(width: 24),
          if (!compact) const Expanded(child: _GeometricScene()),
        ],
      ),
    );
  }
}

class _GeometricScene extends StatelessWidget {
  const _GeometricScene();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 52,
            top: 8,
            child: Transform.rotate(
              angle: .75,
              child: _Shape(size: 88, color: const Color(0xFF6C63FF)),
            ),
          ),
          Positioned(
            right: 118,
            bottom: 12,
            child: Transform.rotate(
              angle: -.35,
              child: _Shape(size: 68, color: const Color(0xFFFFC857)),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 20,
            child: _Circle(size: 82, color: const Color(0xFFFF6F91)),
          ),
          Positioned(
            right: 92,
            top: 58,
            child: _Circle(size: 54, color: const Color(0xFF4BA3FF)),
          ),
          Positioned(
            right: 36,
            top: 76,
            child: Container(
              width: 114,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .16),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: .2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Shape extends StatelessWidget {
  const _Shape({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: .35),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: .34),
            blurRadius: 26,
            offset: const Offset(0, 16),
          ),
        ],
      ),
    );
  }
}

const _shadow = [
  BoxShadow(color: Color(0x14000000), blurRadius: 28, offset: Offset(0, 16)),
];
