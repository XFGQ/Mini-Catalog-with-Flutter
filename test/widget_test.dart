import 'package:mini_catalog/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App Should Load ', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MiniCatalogApp());

    expect(find.text('Discover'), findsOneWidget);
  });
}
