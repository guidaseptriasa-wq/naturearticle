import 'package:flutter_test/flutter_test.dart';
import 'package:naturearticle/main.dart';

void main() {
  testWidgets('Login page tampil', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Login'), findsOneWidget);
  });
}