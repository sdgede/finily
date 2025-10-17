import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/style/style.dart';
import 'package:flutter/material.dart';

class CustemerItem extends StatelessWidget {
  const CustemerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar / badge angka
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Text(
              "12",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),

          const SizedBox(width: 16),

          // Info customer
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "222",
                style: TextStyle(
                  fontSize: AppStyle.h3,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              Text(
                "john.doe@example.com",
                style: TextStyle(
                  fontSize: AppStyle.h4,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Tombol menu (more)
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.edit),
                            title: const Text("Edit"),
                            onTap: () {
                              Navigator.pop(ctx);
                              // Aksi ketika "Edit"
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.delete),
                            title: const Text("Delete"),
                            onTap: () {
                              Navigator.pop(ctx);
                              // Aksi ketika "Delete"
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.more_vert, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
