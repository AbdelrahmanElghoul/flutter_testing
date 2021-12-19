import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('dummyWidget2', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    tester.binding.window.physicalSizeTestValue = Size(200, 50);

    await tester.pumpWidget(
      MaterialApp(
        home: Row(
          textDirection: TextDirection.ltr,
          children: [
            LayoutBuilder(
              builder: (ctx, constrain) {
                print("minWidth ${constrain.minWidth}");
                print("maxWidth ${constrain.maxWidth}");
                print("size ${MediaQuery.of(ctx).size.toString()}");
                return Container(
                  width: 100,
                  height: 20,
                );
              },
            ),
          ],
        ),
      ),
    );
    expect(find.byType(Container), findsOneWidget);
    await tester.pump();
  });
}
