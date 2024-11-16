import 'package:flutter/material.dart';
import '../../components/my_drawer.dart';
import 'expenditurememoinitilization.dart';

class ExpenditurememoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Expenditure'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'EXPENDITURE INITIALIZATION MEMO',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),

                // Button
                ElevatedButton(
                  onPressed: () {
                    // Action to create a new memo
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExpenditureInitializationMemo()),
                  );
                  },
                  child: Text('Create New Expenditure Initialization Memo'),
                ),
                SizedBox(height: 16),

                // Entries & Search Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Show entries dropdown
                    Row(
                      children: [
                        Text('Show '),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '10',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 8,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Text(' entries'),
                      ],
                    ),

                    // Search field
                    Row(
                      children: [
                        Text('Search: '),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter search term',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Data Table
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Action')),
                      DataColumn(label: Text('S/No')),
                      DataColumn(label: Text('Reference No')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Subject')),
                      DataColumn(label: Text('Amount')),
                      DataColumn(label: Text('Status')),

                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              // Action for select
                            },
                            child: Text('Select'),
                          ),
                        ),
                        DataCell(Text('1')),
                        DataCell(Text('WAEC/YABA/IM01/2024/055')),
                        DataCell(Text('9/10/2024')),
                        DataCell(Text('testing dollar')),
                        DataCell(Text('777,000')),
                        DataCell(Text('Draft')),

                      ]),
                    ],
                  ),
                ),

                // Pagination
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Showing 1 to 1 of 1 entries',style: TextStyle(fontSize: 11),),
                    Row(
                      children: [
                          TextButton(
                          onPressed: () {
                            // Previous page action
                          },
                          child: Text('Previous'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('1'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(40, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Next page action
                          },
                          child: Text('Next'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

