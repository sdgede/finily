import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/constant/routes.dart';
import 'package:finily/ui/widgets/appbart/appbar_primary.dart';
import 'package:finily/ui/widgets/buttons/center_create_button.dart';
import 'package:finily/ui/widgets/buttons/floating_butoon.dart';
import 'package:flutter/material.dart';

class CreateInvoice extends StatefulWidget {
  const CreateInvoice({super.key});

  @override
  State<CreateInvoice> createState() => _CreateInvoiceState();
}

class _CreateInvoiceState extends State<CreateInvoice> {
  final _formKey = GlobalKey<FormState>();
  int activeIndex = 5;
  String? selectedCustomer;
  String? selectedCurrency = "United States dollar";

  final List<Map<String, dynamic>> _selectedProducts = [];

  InputDecoration _inputDecoration(String label, {Widget? suffixIcon}) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      suffixIcon: suffixIcon,
    );
  }

  /// BOTTOM SHEET - pilih produk & quantity
  void _showProductSelector() {
    final List<Map<String, dynamic>> products = [
      {"id": 1, "name": "Laptop Asus ROG", "price": 18000000},
      {"id": 2, "name": "Mouse Logitech", "price": 250000},
      {"id": 3, "name": "Keyboard Mechanical", "price": 750000},
      {"id": 4, "name": "Monitor LG 27”", "price": 3200000},
    ];

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
            double total = 0;
            for (var p in products) {
              total += (p['price'] * (quantities[p['id']] ?? 0));
            }

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
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const Text(
                    "Select Products",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        final qty = quantities[product['id']] ?? 0;
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
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
                                Text(
                                  qty.toString(),
                                  style: const TextStyle(fontSize: 16),
                                ),
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
                  const SizedBox(height: 12),
                  Text(
                    "Total: Rp ${total.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
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
                        _selectedProducts.addAll(selected);
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
      appBar: appbarPrimary(text: "Create Invoice", onTap: () {}),
      backgroundColor: AppColors.backgroundColor,
      drawer: const Drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "INVOICE",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: "INV-001",
                decoration: _inputDecoration("Invoice Number"),
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),

              const SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Bill To:"),
                        const SizedBox(height: 8),
                        dropDwonInput(),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          decoration: _inputDecoration("Currency"),
                          value: selectedCurrency,
                          items: const [
                            DropdownMenuItem(
                              value: "United States dollar",
                              child: Text("United States dollar"),
                            ),
                            DropdownMenuItem(
                              value: "Indonesian Rupiah",
                              child: Text("Indonesian Rupiah"),
                            ),
                          ],
                          onChanged:
                              (val) => setState(() => selectedCurrency = val),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Invoice Details:"),
                        const SizedBox(height: 8),
                        TextFormField(
                          initialValue: "PO-2025-XXX",
                          decoration: _inputDecoration("PO/SO Number"),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: _inputDecoration(
                            "Invoice Date",
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: _inputDecoration(
                            "Due Date",
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// PROJECT
              const Text("Project"),
              const SizedBox(height: 8),
              TextFormField(decoration: _inputDecoration("Title")),
              const SizedBox(height: 12),
              TextFormField(
                decoration: _inputDecoration("Description"),
                maxLines: 2,
              ),
              const SizedBox(height: 20),

              /// PRODUCT TABLE
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: const Row(
                        children: [
                          Expanded(flex: 3, child: Text("Item")),
                          Expanded(child: Text("Qty")),
                          Expanded(child: Text("Price")),
                          Expanded(child: Text("Amount")),
                          Expanded(child: Text("Action")),
                        ],
                      ),
                    ),
                    if (_selectedProducts.isEmpty)
                      const SizedBox(
                        height: 50,
                        child: Center(child: Text("No products added")),
                      )
                    else
                      ..._selectedProducts.map((p) {
                        final amount = p["price"] * p["qty"];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Expanded(flex: 3, child: Text(p["name"])),
                              Expanded(child: Text("${p["qty"]}")),
                              Expanded(
                                child: Text(
                                  "Rp ${p["price"].toStringAsFixed(0)}",
                                ),
                              ),
                              Expanded(
                                child: Text("Rp ${amount.toStringAsFixed(0)}"),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () {
                                    setState(() {
                                      _selectedProducts.remove(p);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: _showProductSelector,
                icon: const Icon(Icons.add_circle_outline),
                label: const Text("Add Product"),
              ),
              const SizedBox(height: 20),

              /// NOTES
              const Text("Notes:"),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: "Payment due within 14 days",
                decoration: _inputDecoration("Notes"),
                maxLines: 2,
              ),
              const SizedBox(height: 20),

              /// FOOTER
              const Text("Footer:"),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: "Thank you for your business",
                decoration: _inputDecoration("Footer"),
                maxLines: 2,
              ),
              const SizedBox(height: 20),

              /// SUBMIT BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: invoiceCreate(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: floatingButton(),
    );
  }

  DropdownButtonFormField<String> dropDwonInput() {
    return DropdownButtonFormField<String>(
      decoration: _inputDecoration("Customer"),
      value: selectedCustomer,
      items: const [
        DropdownMenuItem(value: "Customer A", child: Text("Customer A")),
        DropdownMenuItem(value: "Customer B", child: Text("Customer B")),
      ],
      onChanged: (val) => setState(() => selectedCustomer = val),
    );
  }

  BottomAppBar floatingButton() {
    return BottomAppBar(
      height: 75,
      color: AppColors.primaryColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavItem(
            icon: Icons.home,
            label: "Home",
            index: 0,
            currentIndex: activeIndex,
            onPress: () {
              setState(() => activeIndex = 0);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (route) => false,
              );
            },
          ),
          buildNavItem(
            icon: Icons.people,
            label: "Customer",
            index: 1,
            currentIndex: activeIndex,
            onPress: () {
              setState(() => activeIndex = 1);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.customer,
                (route) => false,
              );
            },
          ),
          const SizedBox(width: 40),
          buildNavItem(
            icon: Icons.settings,
            label: "Settings",
            index: 2,
            currentIndex: activeIndex,
            onPress: () {
              setState(() => activeIndex = 2);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (route) => false,
              );
            },
          ),
          buildNavItem(
            icon: Icons.person,
            label: "Profile",
            index: 3,
            currentIndex: activeIndex,
            onPress: () {
              setState(() => activeIndex = 3);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.profile,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
