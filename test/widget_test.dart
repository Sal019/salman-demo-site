import 'package:flutter_test/flutter_test.dart';
import 'package:salman_demo_site/main.dart';

void main() {
  testWidgets('demo site renders hero headline', (WidgetTester tester) async {
    await tester.pumpWidget(const DemoSiteApp());
    expect(find.text('One codebase.\nEvery platform.'), findsOneWidget);
  });
}
