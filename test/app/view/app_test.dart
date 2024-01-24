import 'package:flutter_test/flutter_test.dart';
import 'package:juntos_app/test/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const CounterPage());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
