import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/main.dart';

void main() {
  testWidgets('Quiz displays first question and moves to second', (WidgetTester tester) async {
    await tester.pumpWidget(const QuizApp());

    expect(find.text('The sky is blue.'), findsOneWidget);
    expect(find.text('Score: 0'), findsOneWidget);

    await tester.tap(find.text('True'));
    await tester.pump();

    await tester.tap(find.text('Next'));
    await tester.pump();

    expect(find.text('Cats can fly.'), findsOneWidget);
  });
}
