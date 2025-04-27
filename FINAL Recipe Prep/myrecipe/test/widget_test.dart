import 'package:flutter_test/flutter_test.dart';

import 'package:myrecipe/main.dart';

void main() {
  testWidgets('App loads correctly', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyRecipeApp());

    // Verify the home page shows the button
    expect(find.text('View Recipe Categories'), findsOneWidget);
  });
}
