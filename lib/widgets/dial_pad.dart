import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dial_button.dart';

class DialPad extends StatefulWidget {
  const DialPad({super.key});

  @override
  _DialPadState createState() => _DialPadState();
}

class _DialPadState extends State<DialPad> {
  final TextEditingController _numberController = TextEditingController();

  void _addNumber(String number) {
    _numberController.text += number;
  }

  Future<void> _makeCall() async {
    final Uri url = Uri.parse('tel:${_numberController.text}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not make call')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _numberController,
            decoration: const InputDecoration(
              hintText: 'Enter phone number',
            ),
            readOnly: true,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              for (var i = 1; i <= 9; i++)
                DialButton(
                  number: '$i',
                  onPressed: () => _addNumber('$i'),
                ),
              DialButton(
                number: '*',
                onPressed: () => _addNumber('*'),
              ),
              DialButton(
                number: '0',
                onPressed: () => _addNumber('0'),
              ),
              DialButton(
                number: '#',
                onPressed: () => _addNumber('#'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            onPressed: _makeCall,
            child: const Icon(Icons.call),
          ),
        ),
      ],
    );
  }
}
