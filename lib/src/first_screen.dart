import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:a5_test_task/src/second_screen.dart';
import 'package:a5_test_task/src/formatter.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _phoneFieldController = TextEditingController();
  final RegExp _pattern = RegExp(
      r'^\(\d{3}\)\s\d{3}\-\d{4}'); //Шаблон валидации номера. Пример подходяшего номера: (201) 555-0123
  String _enteredLine = '';
  bool _isNumberValid = false;

  @override
  void initState() {
    super.initState();
    _phoneFieldController.addListener(_onPhoneChange);
  }

  @override
  void dispose() {
    _phoneFieldController.dispose();
    super.dispose();
  }

  _onPhoneChange() {
    setState(() {
      _enteredLine = _phoneFieldController.text;
      _isNumberValid = (_pattern.hasMatch(_enteredLine)) ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _isNumberValid
          ? FloatingActionButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (context) =>
                        SecondScreen(phoneNumber: _enteredLine));
                Navigator.push(context, route);
              },
              child: const Icon(Icons.arrow_forward))
          : null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Get Started',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _phoneFieldController,
                  autofocus: true,
                  inputFormatters: [
                    CustomPhoneFormatter(),
                    LengthLimitingTextInputFormatter(14),
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: 'start typing',
                      hintStyle: const TextStyle(color: Colors.grey),
                      helperText: 'Enter your phone number',
                      helperStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: (_enteredLine.isNotEmpty)
                          ? IconButton(
                              onPressed: () => _phoneFieldController.clear(),
                              icon: const Icon(Icons.highlight_remove,
                                  color: Colors.red, size: 24))
                          : null),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
