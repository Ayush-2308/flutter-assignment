import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/hero_banner.dart';
import '../widgets/performance_chart.dart';
import '../widgets/projects_card.dart';
import '../widgets/right_panel.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_creators_card.dart';
import '../widgets/top_navbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;
        final isDesktop = width > 1100;

        return Scaffold(
          drawer: isMobile ? const Drawer(child: Sidebar()) : null,
          backgroundColor: AppColors.background,
          body: Row(
            children: [
              if (!isMobile) const Sidebar(),
              Expanded(
                child: SafeArea(
                  child: Builder(
                    builder: (context) => SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(
                        isMobile ? 16 : 28,
                        22,
                        isMobile ? 16 : 28,
                        28,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TopNavbar(
                            isMobile: isMobile,
                            onMenuTap: () => Scaffold.of(context).openDrawer(),
                          ),
                          const SizedBox(height: 24),
                          const HeroBanner(),
                          const SizedBox(height: 22),
                          LayoutBuilder(
                            builder: (context, inner) {
                              final stackCards = inner.maxWidth < 760;
                              if (stackCards) {
                                return const Column(
                                  children: [
                                    ProjectsCard(),
                                    SizedBox(height: 18),
                                    TopCreatorsCard(),
                                  ],
                                );
                              }
                              return const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: ProjectsCard()),
                                  SizedBox(width: 20),
                                  Expanded(child: TopCreatorsCard()),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 22),
                          const PerformanceChart(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (isDesktop) const RightPanel(),
            ],
          ),
        );
      },
    );
  }
}
