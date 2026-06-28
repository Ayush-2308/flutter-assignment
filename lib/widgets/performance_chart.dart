import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 345,
      padding: const EdgeInsets.all(22),
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
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 10,
            children: [
              const Text(
                'Over All Performance The Years',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _Legend(color: AppColors.blue, label: 'Pending Done'),
                  SizedBox(width: 16),
                  _Legend(color: AppColors.primary, label: 'Project Done'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 26),
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 2015,
                maxX: 2020,
                minY: 0,
                maxY: 60,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 10,
                  getDrawingHorizontalLine: (_) =>
                      FlLine(color: AppColors.border, strokeWidth: 1),
                ),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 34,
                      interval: 10,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) => Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    tooltipRoundedRadius: 12,
                    getTooltipColor: (_) => AppColors.textPrimary,
                    getTooltipItems: (spots) => spots
                        .map(
                          (spot) => const LineTooltipItem(
                            '2023 +55',
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  getTouchedSpotIndicator: (_, indicators) => indicators
                      .map(
                        (_) => TouchedSpotIndicatorData(
                          FlLine(
                            color: AppColors.primary.withValues(alpha: .25),
                            strokeWidth: 1,
                          ),
                          FlDotData(show: true),
                        ),
                      )
                      .toList(),
                ),
                showingTooltipIndicators: [
                  ShowingTooltipIndicators([
                    LineBarSpot(_purpleLine, 1, _purpleLine.spots[4]),
                  ]),
                ],
                lineBarsData: [_blueLine, _purpleLine],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final _blueLine = LineChartBarData(
  spots: const [
    FlSpot(2015, 16),
    FlSpot(2016, 28),
    FlSpot(2017, 23),
    FlSpot(2018, 36),
    FlSpot(2019, 45),
    FlSpot(2020, 38),
  ],
  isCurved: true,
  color: AppColors.blue,
  barWidth: 4,
  dotData: const FlDotData(show: false),
  belowBarData: BarAreaData(
    show: true,
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.blue.withValues(alpha: .22),
        AppColors.blue.withValues(alpha: .02),
      ],
    ),
  ),
);

final _purpleLine = LineChartBarData(
  spots: const [
    FlSpot(2015, 8),
    FlSpot(2016, 16),
    FlSpot(2017, 32),
    FlSpot(2018, 27),
    FlSpot(2019, 55),
    FlSpot(2020, 42),
  ],
  isCurved: true,
  color: AppColors.primary,
  barWidth: 4,
  dotData: FlDotData(show: true, checkToShowDot: (spot, _) => spot.x == 2019),
  belowBarData: BarAreaData(
    show: true,
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.primary.withValues(alpha: .22),
        AppColors.primary.withValues(alpha: .02),
      ],
    ),
  ),
);

class _Legend extends StatelessWidget {
  const _Legend({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 7),
        Text(
          label,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
      ],
    );
  }
}
