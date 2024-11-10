// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

import '../MainLayout.dart';

class BudgetDashboard extends StatefulWidget {
  final String category;
  final List<dynamic> items;
  BudgetDashboard({super.key, required this.category, required this.items});

  @override
  State<BudgetDashboard> createState() => _BudgetDashboardState();
}

class _BudgetDashboardState extends State<BudgetDashboard> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: widget.category,
      body: widget.items.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio:
                    1.0, // Adjust the aspect ratio of each container
              ),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                var item = widget.items[index];
                return GestureDetector(
                  onTap: () {
                    // Handle item tap (e.g., show details)
                    print('Selected: ${item['subMenuName']}');
                  },
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4.0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            item['subMenuName'] ?? 'No Name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            item['menuName'] ?? 'No Category',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
