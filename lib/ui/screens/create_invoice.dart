import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/constant/routes.dart';
import 'package:finily/ui/widgets/appbart/appbar_primary.dart';
import 'package:finily/ui/widgets/buttons/center_create_button.dart';
import 'package:finily/ui/widgets/buttons/floating_butoon.dart';
import 'package:finily/ui/widgets/forms/input_text.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarPrimary(text: "Create Invoice", onTap: () {}),
      drawer: Drawer(),
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
              InputText(
                initialValue: "INV-001",
                hint: "INV-001",
                label: "Invoice Number",
                controller: TextEditingController(),
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
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Currency",
                          ),
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
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "PO/SO Number",
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Invoice Date",
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Due Date",
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Project
              const Text("Project"),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Description",
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 20),

              /// Product Table (dummy)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Item",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Qty",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Price",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Amount",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Action",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                      child: Center(child: Text("No products added")),
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline),
                label: const Text("Add Product"),
              ),
              const SizedBox(height: 20),

              /// Notes
              const Text("Notes:"),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: "Payment due within 14 days",
                decoration: const InputDecoration(border: OutlineInputBorder()),
                maxLines: 2,
              ),
              const SizedBox(height: 20),

              /// Footer
              const Text("Footer:"),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: "Thank you for your business",
                decoration: const InputDecoration(border: OutlineInputBorder()),
                maxLines: 2,
              ),
              const SizedBox(height: 20),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Submit"),
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
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Customer",
      ),
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
          const SizedBox(width: 40), // space for FAB
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
