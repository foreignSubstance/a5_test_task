import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String phoneNumber;

  const SecondScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome,',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text(phoneNumber,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const Divider(),
              Image.network(
                  'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                  width: 256,
                  height: 256),
              const Divider(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'))
            ],
          ),
        ),
      ),
    );
  }
}
