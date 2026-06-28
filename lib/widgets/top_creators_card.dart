import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class TopCreatorsCard extends StatelessWidget {
  const TopCreatorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ('@maddison_c21', '9821', 3, const Color(0xFFFFC7A8)),
      ('@karlwill02', '7032', 2, const Color(0xFFB8E4FF)),
      ('@maddison_c21', '9821', 3, const Color(0xFFD8C4FF)),
      ('@maddison_c21', '9821', 2, const Color(0xFFFFD6E0)),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 24,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Creators',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(flex: 5, child: _Header('Name')),
              Expanded(flex: 2, child: _Header('Artworks')),
              Expanded(flex: 3, child: _Header('Rating')),
            ],
          ),
          const SizedBox(height: 10),
          for (final row in rows) _CreatorRow(row: row),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 12,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _CreatorRow extends StatelessWidget {
  const _CreatorRow({required this.row});

  final (String, String, int, Color) row;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: row.$4,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 9),
                Flexible(
                  child: Text(
                    row.$1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              row.$2,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
          ),
          Expanded(flex: 3, child: _Bars(count: row.$3)),
        ],
      ),
    );
  }
}

class _Bars extends StatelessWidget {
  const _Bars({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Container(
          width: 8,
          height: 22 - (index * 4),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: index < count
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: .16),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
