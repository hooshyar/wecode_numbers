import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wecode_numbers/src/screens/numbers_screen.dart';
import 'package:wecode_numbers/src/screens/numbers_screen.dart';
import 'package:wecode_numbers/src/screens/numbers_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NumbersScreen(),
    );
  }
}
