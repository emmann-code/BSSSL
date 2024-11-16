// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'dart:convert';

import 'package:flutter/material.dart';

import '../MainLayout.dart';
import 'StaffAdv&Retirment.dart';
import 'StaffAdvRequest.dart';
import 'capital_requisition.dart';
import 'expenditure_memo_initialization.dart';
import 'staff_request_inquiry.dart';
import 'update_attachement.dart';

class FinancialDashboard extends StatefulWidget {
  final String category;
  final List<dynamic> items;
  FinancialDashboard({super.key, required this.category, required this.items});

  @override
  State<FinancialDashboard> createState() => _FinancialDashboardState();
}

class _FinancialDashboardState extends State<FinancialDashboard> {
  void navigateToPage(String pageName) {
    if (pageName == 'Staff Advance Request') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainLayout(
                  title: 'Staff Advance Request',
                  body: StaffAdvanceRequestPage(),
                )),
      );
    } else if (pageName == 'Capital/Purchase Requisition (Online)') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainLayout(
                  title: 'Capital/Purchase Requisition (Online)',
                  body: CapitalrequistionPage(),
                )),
      );
    } else if (pageName == 'Staff Request Inquiry') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainLayout(
                  title: 'Staff Request Inquiry',
                  body: StaffrequestinquiryPage(),
                )),
      );
    } else if (pageName == 'Expenditure Initialization Memo') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainLayout(
                  title: 'Expenditure Initialization Memo',
                  body: ExpenditureInitializationMemo(),
                )),
      );
    } else if (pageName == 'Update Attachment') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainLayout(
                  title: 'Update Attachment',
                  body: UpdateattachmentPage(),
                )),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainLayout(
                  title: 'Staff Advance Retirement/Reimbursement',
                  body: StaffAdvanceRetirementPage(),
                )),
      );
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
                    print('page name is : ${item['subMenuName']}');
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
