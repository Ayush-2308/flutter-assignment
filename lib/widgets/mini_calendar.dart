import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class MiniCalendar extends StatefulWidget {
  const MiniCalendar({super.key});

  @override
  State<MiniCalendar> createState() => _MiniCalendarState();
}

class _MiniCalendarState extends State<MiniCalendar> {
  int selectedDay = 30;

  @override
  Widget build(BuildContext context) {
    final cells = <int?>[25, 26, 27, 28, 29, 30, null];
    cells.addAll(List.generate(31, (index) => index + 1));
    while (cells.length % 7 != 0) {
      cells.add(null);
    }

    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _DayLabel('Mo'),
            _DayLabel('Tu'),
            _DayLabel('We'),
            _DayLabel('Th'),
            _DayLabel('Fr'),
            _DayLabel('Sa'),
            _DayLabel('Su'),
          ],
        ),
        const SizedBox(height: 10),
        GridView.builder(
          itemCount: cells.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 7,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            final day = cells[index];
            final trailing = index < 6;
            if (day == null) return const SizedBox.shrink();
            final selected = !trailing && day == selectedDay;
            return InkWell(
              borderRadius: BorderRadius.circular(999),
              onTap: trailing ? null : () => setState(() => selectedDay = day),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? AppColors.primary : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$day',
                  style: TextStyle(
                    color: selected
                        ? Colors.white
                        : trailing
                            ? AppColors.textSecondary.withValues(alpha: .38)
                            : AppColors.textPrimary,
                    fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _DayLabel extends StatelessWidget {
  const _DayLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
