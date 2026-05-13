import 'package:flutter/material.dart';
import '../models/product.dart';

class DetailScreen extends StatelessWidget {
  final Data product;

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey.shade100,
              alignment: Alignment.center,
              child: (product.image != null && product.image!.isNotEmpty)
                  ? Image.network(
                      product.image!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 100),
                    )
                  : const Icon(Icons.image, size: 100),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? 'No Name',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.price ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description ?? 'No description available.',
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  if (product.specs != null) ...[
                    const SizedBox(height: 24),
                    const Text(
                      'Specifications :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildSpecsList(product.specs!),
                  ],
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} sepete eklendi!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Add to Cart',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecsList(Specs specs) {
    final Map<String, dynamic> specsMap = specs.toJson();
    final nonNullSpecs = specsMap.entries
        .where((e) => e.value != null && e.value.toString().isNotEmpty)
        .toList();

    return Column(
      children: nonNullSpecs.map((entry) {
        String keyName = entry.key[0].toUpperCase() + entry.key.substring(1);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  keyName,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  entry.value.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
