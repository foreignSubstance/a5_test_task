import 'package:flutter/material.dart';
import 'package:a5_test_task/first_screen.dart';

void main() => runApp(const PhoneValidatorApp());

class PhoneValidatorApp extends StatelessWidget {
  const PhoneValidatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'A5 test task', home: FirstScreen());
  }
}