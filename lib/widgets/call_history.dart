import 'package:flutter/material.dart';

class CallHistory extends StatelessWidget {
  const CallHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Dummy data count
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.call_received),
          title: Text('Contact $index'),
          subtitle: Text('${DateTime.now().subtract(Duration(days: index))}'),
          trailing: IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Implement call functionality
            },
          ),
        );
      },
    );
  }
}