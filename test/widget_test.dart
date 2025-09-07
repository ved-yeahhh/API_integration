import 'package:flutter_test/flutter_test.dart';
import 'package:project02/main.dart';

void main() {
  testWidgets('App launches without errors', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    // Wait for all frames to settle
    await tester.pumpAndSettle();

    // Check that the main widget exists
    expect(find.byType(MyApp), findsOneWidget);
  });
}
