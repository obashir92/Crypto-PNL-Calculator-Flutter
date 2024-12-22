import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = <String>['BTC', 'ETH', 'LTC', 'XRP'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white70,
            border: OutlineInputBorder(),
            labelText: 'Select Asset'),
        items: items
            .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
        onChanged: (Object? value) {},
      ),
    );
  }
}
