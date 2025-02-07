import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/contacts_provider.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(
      builder: (context, contactsProvider, child) {
        if (contactsProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        
        return ListView.builder(
          itemCount: contactsProvider.contacts.length,
          itemBuilder: (context, index) {
            final contact = contactsProvider.contacts[index];
            return ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(contact.displayName ?? ''),
              subtitle: Text(contact.phones?.first.value ?? ''),
              trailing: IconButton(
                icon: const Icon(Icons.call),
                onPressed: () {
                  // Implement call functionality
                },
              ),
            );
          },
        );
      },
    );
  }
}