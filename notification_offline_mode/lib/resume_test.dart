import 'package:flutter/material.dart';

class ResumeTest extends StatelessWidget {
  final String? payload;
  const ResumeTest({Key? key, this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Offline Mode'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(payload ?? '',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Resume Test ...',
            )
          ],
        ),
      ),
    );
  }
}
