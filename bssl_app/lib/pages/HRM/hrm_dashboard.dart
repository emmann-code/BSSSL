// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print
import 'package:bssl_app/pages/HRM/change_of_bank_details.dart';
import 'package:bssl_app/pages/HRM/leave_roster.dart';
import 'package:bssl_app/pages/HRM/next_of_kin_details.dart';
import 'package:flutter/material.dart';

import '../MainLayout.dart';

class HrmDashboard extends StatefulWidget {
  final String category;
  final List<dynamic> items;
  HrmDashboard({super.key, required this.category, required this.items});

  @override
  State<HrmDashboard> createState() => _HrmDashboardState();
}

class _HrmDashboardState extends State<HrmDashboard> {
  void navigateToPage(String pageName) {
    if (pageName == 'Leave Roster') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainLayout(
                  title: 'Leave Roster',
                  body: LeaveRoster(),
                )),
      );
    } else if (pageName == 'Next of Kin Details') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainLayout(
                  title: 'Next of Kin Details',
                  body: NextOfKinDetails(),
                )),
      );
    } else if (pageName == 'Change Of Bank Details') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainLayout(
                  title: 'Change Of Bank Details',
                  body: ChangeBankDetails(),
                )),
      );
    } else if (pageName == 'Expenditure') {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ExpenditurePage()),
      // );
    } else {
      // Fallback for unrecognized pages
      print('No page found for $pageName');
    }
  }

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
                    navigateToPage(item['subMenuName'] ?? 'No Name');
                    print("item name : ${item['subMenuName']}");
                  },
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
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
