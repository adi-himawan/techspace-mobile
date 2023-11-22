import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final String name;
  final String amount;
  final String description;
  final String price;

  const ItemDetailPage(
      {super.key,
      required this.name,
      required this.amount,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Detail Item',
          ),
        ),
        backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Amount: $amount'),
            const SizedBox(height: 10),
            Text('Description: $description'),
            const SizedBox(height: 10),
            Text('Price: Rp. $price'),
          ],
        ),
      ),
    );
  }
}
