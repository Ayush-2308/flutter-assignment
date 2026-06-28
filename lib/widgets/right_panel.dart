import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'birthday_card.dart';
import 'mini_calendar.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: AppColors.background,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 22, 22, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'GENERAL 10:00 AM TO 7:00 PM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: const [
                  Expanded(child: _DropdownPill(label: 'OCT')),
                  SizedBox(width: 10),
                  Expanded(child: _DropdownPill(label: '2033')),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(16),
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
                child: const MiniCalendar(),
              ),
              const SizedBox(height: 18),
              const CelebrationCard(
                title: 'Today Birthday',
                total: 2,
                buttonLabel: 'Birthday Wishing',
                colors: [Color(0xFFFFC7A8), Color(0xFFD8C4FF)],
              ),
              const SizedBox(height: 18),
              const CelebrationCard(
                title: 'Anniversary',
                total: 3,
                buttonLabel: 'Anniversary Wishing',
                colors: [
                  Color(0xFFB8E4FF),
                  Color(0xFFFFD6E0),
                  Color(0xFFFFE08A),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DropdownPill extends StatelessWidget {
  const _DropdownPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(width: 5),
          const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
        ],
      ),
    );
  }
}
