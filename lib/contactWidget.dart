import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});
  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  bool isButtonEnabled = true;

  void toggleButtonState() {
    setState(() {
      isButtonEnabled = !isButtonEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
            ElevatedButton(
              onPressed: toggleButtonState,
              child: Text(isButtonEnabled ? 'Contacter' : 'Voir msg'),
            ),
            const SizedBox(height: 10),
            ]);
  }
}