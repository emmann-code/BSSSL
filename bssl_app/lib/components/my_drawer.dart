import 'package:flutter/material.dart';
import '../pages/Finiacial/CapitalRequistion.dart';
import '../pages/Finiacial/Expenditurememo.dart';
import '../pages/Finiacial/StaffAdv&Retirment.dart';
import '../pages/Finiacial/StaffAdvRequest.dart';
import '../pages/Finiacial/StaffRequestInquiry.dart';
import '../pages/Finiacial/UpdateAttachment.dart'; // Import the StaffAdvanceRetirementPage

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Admin"),
            accountEmail: const Text("admin@example.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://img.freepik.com/free-photo/view-cartoon-male-chef-with-delicious-3d-pizza_23-2151017583.jpg?t=st=1724622710~exp=1724626310~hmac=d63d346b5e93d6979cd43609045fc96ab492693f6a81ab294226e5be6908b48d&w=740",
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ListTile(
            title: const Text('Dashboard'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Budget Preparation'),
            onTap: () {},
          ),
          ExpansionTile(
            title: const Text('Financial'),
            initiallyExpanded: _expanded,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _expanded = expanded;
              });
            },
            children: [
              ListTile(
                title: const Text('Expenditure Initialization Memo'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExpenditurememoPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Staff Advance Retirement and Reimbursement'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StaffAdvanceRetirementPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Staff Request Inquiry'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StaffrequestinquiryPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Update Attachment'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateattachmentPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Staff Advance Request'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StaffAdvanceRequestPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Capital/Purchase Requisition(Online)'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CapitalrequistionPage()),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('HRM'),
            initiallyExpanded: _expanded,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _expanded = expanded;
              });
            },
            children: [
              ListTile(
                title: const Text('Staff Development Appraisal'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Leave Application'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Change Of Bank Details'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Next of Kin Details'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Leave Roster'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Staff Request Inquiry HRM '),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Approval Process Change'),
                onTap: () {},
              ),
            ],
          ),
          ListTile(
            title: const Text('FINANCIAL WORKFLOW PROCESS SETUP'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('HRM WORKFLOW PROCESS SETUP'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Create User Account'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
