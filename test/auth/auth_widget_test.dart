import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flutter/main.dart';
import 'package:testing_flutter/ui/login_page.dart';

void main() {
  testWidgets('auth', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Verify that our counter starts at 0.
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(FlatButton), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.press(find.byType(FlatButton));
    //setState
    await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });

  testWidgets('dummyWidget1', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    tester.binding.window.physicalSizeTestValue = Size(200, 50);

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(200, 50)),
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              LayoutBuilder(
                builder: (ctx, constrain) {
                  print("minWidth ${constrain.minWidth}");
                  print("maxWidth ${constrain.maxWidth}");
                  print("size ${MediaQuery.of(ctx).size.toString()}");
                  return Container(
                    width: 100,
                    height: 50,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

    // Verify that our counter starts at 0.
    // expect(find.byType(TextField), findsNWidgets(2));
    // expect(find.byType(FlatButton), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    // Tap the '+' icon and trigger a frame.
    // await tester.press(find.byType(FlatButton));
    await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
  
}
