import 'package:flutter/material.dart';

class AddProductExample extends StatefulWidget {
  const AddProductExample({super.key});

  @override
  State<AddProductExample> createState() => _AddProductExampleState();
}

class _AddProductExampleState extends State<AddProductExample> {
  List<Map<String, dynamic>> selectedProducts = [];

  void _showProductBottomSheet() {
    final List<Map<String, dynamic>> products = [
      {"id": 1, "name": "Laptop Asus ROG", "price": 18000000},
      {"id": 2, "name": "Mouse Logitech", "price": 250000},
      {"id": 3, "name": "Keyboard Mechanical", "price": 750000},
      {"id": 4, "name": "Monitor LG 27”", "price": 3200000},
    ];

    // Map untuk menyimpan jumlah masing-masing produk
    Map<int, int> quantities = {};

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Select Product",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        final qty = quantities[product['id']] ?? 0;

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text(product['name']),
                            subtitle: Text(
                              "Rp ${product['price'].toStringAsFixed(0)}",
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    if (qty > 0) {
                                      setModalState(() {
                                        quantities[product['id']] = qty - 1;
                                      });
                                    }
                                  },
                                ),
                                Text(qty.toString()),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    setModalState(() {
                                      quantities[product['id']] = qty + 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      final selected =
                          products
                              .where((p) => (quantities[p['id']] ?? 0) > 0)
                              .map(
                                (p) => {
                                  "id": p['id'],
                                  "name": p['name'],
                                  "price": p['price'],
                                  "qty": quantities[p['id']],
                                },
                              )
                              .toList();

                      setState(() {
                        selectedProducts.addAll(selected);
                      });

                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text("Add Selected Products"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Invoice Creator")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextButton.icon(
              onPressed: _showProductBottomSheet,
              icon: const Icon(Icons.add_circle_outline),
              label: const Text("Add Product"),
            ),
            const SizedBox(height: 16),
            if (selectedProducts.isEmpty)
              const Text(
                "No products added yet.",
                style: TextStyle(color: Colors.grey),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: selectedProducts.length,
                  itemBuilder: (context, index) {
                    final item = selectedProducts[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(item["name"]),
                        subtitle: Text(
                          "Qty: ${item["qty"]} • Rp ${(item["price"] * item["qty"]).toStringAsFixed(0)}",
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
