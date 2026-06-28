import 'package:flutter_test/flutter_test.dart';
import 'package:office_dashboard/main.dart';

void main() {
  testWidgets('dashboard renders home title', (tester) async {
    await tester.pumpWidget(const DashboardApp());
    expect(find.text('Home'), findsWidgets);
    expect(find.text('Top Rating Project'), findsOneWidget);
  });
}
