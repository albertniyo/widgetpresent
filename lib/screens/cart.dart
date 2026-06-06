import 'package:flutter/material.dart';

/* cart screen shows a list of fruit items
 * refactored to use list and map for simplicity
 */
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // cart items data
  final List<Map<String, String>> cartItems = const [
    {
      'name': 'Apple',
      'intro': 'Fresh & Juicy',
      'image': 'assets/images/apple.jpg',
    },
    {
      'name': 'Banana',
      'intro': 'Rich in Potassium',
      'image': 'assets/images/banana.jpg',
    },
    {
      'name': 'Orange',
      'intro': 'Citrus Burst',
      'image': 'assets/images/orange.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: cartItems
            .map((item) => _buildCartRow(item, context))
            .toList(),
      ),
    );
  }

  // builds a single cart row
  Widget _buildCartRow(Map<String, String> item, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item['image']!,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: 70,
                height: 70,
                color: Colors.grey[300],
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['intro']!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('${item['name']} added')));
            },
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
