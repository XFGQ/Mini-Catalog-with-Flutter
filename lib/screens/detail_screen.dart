import 'package:flutter/material.dart';
import '../models/product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Ürün Resmi
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: const Icon(Icons.image, size: 100),
          ),
          const SizedBox(height: 20),
          // Ürün Bilgileri
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.price,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 10),
                Text(product.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
