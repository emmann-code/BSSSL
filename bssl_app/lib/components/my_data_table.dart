// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'my_textfieild.dart';
//
// class MyDatatable extends StatelessWidget {
//    MyDatatable({super.key});
//   final TextEditingController NatureofExpensesController = TextEditingController();
//   final TextEditingController tablequantityController = TextEditingController();
//   final TextEditingController tablereceiptController = TextEditingController();
//   final TextEditingController tableamountController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(width: 2,),
//         shape: BoxShape.rectangle,
//       ),clipBehavior: Clip.antiAlias,
//         columns: [
//           DataColumn(label: Text("S/N")),
//           DataColumn(label: Text("Expense Description")),
//           DataColumn(label: Text("Nature of Expenses")),
//           DataColumn(label: Text("Quantity ")),
//           DataColumn(label: Text("Receipt Number")),
//           DataColumn(label: Text("Amount")),
//         ],
//         rows: [
//           DataRow(cells: [DataCell(Text('1')), DataCell(Text('Hotel Bills'),), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablequantityController,keyboardType: TextInputType.number, maxLines: 2,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
//           ))]),
//           DataRow(cells: [DataCell(Text('2')), DataCell(Text('Cost of Drugs')), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablequantityController,keyboardType: TextInputType.number, maxLines: 2,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
//           ))]),
//           DataRow(cells: [DataCell(Text('3')), DataCell(Text('Vehicles Running Expenses')), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablequantityController, keyboardType: TextInputType.number,maxLines: 2,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
//           ))]),
//           DataRow(cells: [DataCell(Text('4')), DataCell(Text('Air Ticket')), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablequantityController, keyboardType: TextInputType.number,maxLines: 2,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
//           ))]),
//           DataRow(cells: [DataCell(Text('5')), DataCell(Text('Night Allowances')), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablequantityController,keyboardType: TextInputType.number, maxLines: 2,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablereceiptController, keyboardType: TextInputType.number,maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
//           ))]),
//           DataRow(cells: [DataCell(Text('6')), DataCell(Text('Kilometer claim')), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablequantityController,keyboardType: TextInputType.number, maxLines: 2,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "0", controller: tableamountController, keyboardType: TextInputType.number,maxLines: 2, inputFormatters: []),
//           ))]),
//           DataRow(cells: [DataCell(Text('7')), DataCell(Text('Cost of Meal/Snacks')), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablequantityController,keyboardType: TextInputType.number, maxLines: 2,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablereceiptController, keyboardType: TextInputType.number,maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
//           ))]),
//           DataRow(cells: [DataCell(Text('8')), DataCell(Text('Taxi Fares')), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablequantityController, keyboardType: TextInputType.number,maxLines: 2,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
//           ))]),
//           DataRow(cells: [DataCell(Text('9')), DataCell(Text('Others')), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablequantityController, keyboardType: TextInputType.number,maxLines: 2,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "", controller: tablereceiptController, keyboardType: TextInputType.number,maxLines: 3, inputFormatters: []),
//           )), DataCell(Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
//           ))]),
//         ],
//       ),
//     );
//   }
// }


//
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'my_textfieild.dart';
// class MyDatatable extends StatefulWidget {
//   @override
//   _MyDatatableState createState() => _MyDatatableState();
// }
//
// class _MyDatatableState extends State<MyDatatable> {
//   // Create lists of TextEditingControllers for each column
//   final List<TextEditingController> natureOfExpensesControllers = [];
//   final List<TextEditingController> quantityControllers = [];
//   final List<TextEditingController> receiptControllers = [];
//   final List<TextEditingController> amountControllers = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers for each row (in this case 9 rows)
//     for (int i = 0; i < 9; i++) {
//       natureOfExpensesControllers.add(TextEditingController());
//       quantityControllers.add(TextEditingController());
//       receiptControllers.add(TextEditingController());
//       amountControllers.add(TextEditingController());
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose of all the controllers to avoid memory leaks
//     for (var controller in natureOfExpensesControllers) {
//       controller.dispose();
//     }
//     for (var controller in quantityControllers) {
//       controller.dispose();
//     }
//     for (var controller in receiptControllers) {
//       controller.dispose();
//     }
//     for (var controller in amountControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(width: 2),
//           shape: BoxShape.rectangle,
//         ),
//         clipBehavior: Clip.antiAlias,
//         columns: const [
//           DataColumn(label: Text("S/N")),
//           DataColumn(label: Text("Expense Description")),
//           DataColumn(label: Text("Nature of Expenses")),
//           DataColumn(label: Text("Quantity ")),
//           DataColumn(label: Text("Receipt Number")),
//           DataColumn(label: Text("Amount")),
//         ],
//         rows: List<DataRow>.generate(
//           9,
//               (index) => DataRow(cells: [
//             DataCell(Text('${index + 1}')),
//             DataCell(Text(_getExpenseDescription(index))),
//             DataCell(Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CustomTextField(
//                 label: "",
//                 controller: natureOfExpensesControllers[index],
//                 maxLines: 3,
//                 inputFormatters: [],
//               ),
//             )),
//             DataCell(Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CustomTextField(
//                 label: "",
//                 controller: quantityControllers[index],
//                 keyboardType: TextInputType.number,
//                 maxLines: 2,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
//                 ],
//               ),
//             )),
//             DataCell(Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CustomTextField(
//                 label: "",
//                 controller: receiptControllers[index],
//                 keyboardType: TextInputType.number,
//                 maxLines: 3,
//                 inputFormatters: [],
//               ),
//             )),
//             DataCell(Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CustomTextField(
//                 label: "0",
//                 controller: amountControllers[index],
//                 keyboardType: TextInputType.number,
//                 maxLines: 2,
//                 inputFormatters: [],
//               ),
//             )),
//           ]),
//         ),
//       ),
//     );
//   }
//
//   // Helper method to get the expense description based on the row index
//   String _getExpenseDescription(int index) {
//     switch (index) {
//       case 0:
//         return 'Hotel Bills';
//       case 1:
//         return 'Cost of Drugs';
//       case 2:
//         return 'Vehicles Running Expenses';
//       case 3:
//         return 'Air Ticket';
//       case 4:
//         return 'Night Allowances';
//       case 5:
//         return 'Kilometer claim';
//       case 6:
//         return 'Cost of Meal/Snacks';
//       case 7:
//         return 'Taxi Fares';
//       case 8:
//         return 'Others';
//       default:
//         return '';
//     }
//   }
// }






import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_textfieild.dart';

class MyDatatable extends StatefulWidget {
  @override
  _MyDatatableState createState() => _MyDatatableState();
}

class _MyDatatableState extends State<MyDatatable> {
  // Create lists of TextEditingControllers for each column
  final List<TextEditingController> natureOfExpensesControllers = [];
  final List<TextEditingController> quantityControllers = [];
  final List<TextEditingController> receiptControllers = [];
  final List<TextEditingController> amountControllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize controllers for each row (in this case 9 rows)
    for (int i = 0; i < 9; i++) {
      natureOfExpensesControllers.add(TextEditingController());
      quantityControllers.add(TextEditingController());
      receiptControllers.add(TextEditingController());
      amountControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    // Dispose of all the controllers to avoid memory leaks
    for (var controller in natureOfExpensesControllers) {
      controller.dispose();
    }
    for (var controller in quantityControllers) {
      controller.dispose();
    }
    for (var controller in receiptControllers) {
      controller.dispose();
    }
    for (var controller in amountControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2),
          shape: BoxShape.rectangle,
        ),
        clipBehavior: Clip.antiAlias,
        columns: const [
          DataColumn(label: Text("S/N")),
          DataColumn(label: Text("Expense Description")),
          DataColumn(label: Text("Nature of Expenses")),
          DataColumn(label: Text("Quantity ")),
          DataColumn(label: Text("Receipt Number")),
          DataColumn(label: Text("Amount")),
        ],
        rows: List<DataRow>.generate(
          9,
              (index) => DataRow(cells: [
            DataCell(Text('${index + 1}')),
            DataCell(Text(_getExpenseDescription(index))),
            DataCell(Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                label: "",
                controller: natureOfExpensesControllers[index],
                maxLines: 3,
                inputFormatters: [],
              ),
            )),
            DataCell(Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                label: "",
                controller: quantityControllers[index],
                keyboardType: TextInputType.number,
                maxLines: 2,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                ],
              ),
            )),
            DataCell(Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                label: "",
                controller: receiptControllers[index],
                keyboardType: TextInputType.number,
                maxLines: 3,
                inputFormatters: [],
              ),
            )),
            DataCell(Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                label: "0",
                controller: amountControllers[index],
                keyboardType: TextInputType.number,
                maxLines: 2,
                inputFormatters: [],
              ),
            )),
          ]),
        ),
      ),
    );
  }

  // Helper method to get the expense description based on the row index
  String _getExpenseDescription(int index) {
    switch (index) {
      case 0:
        return 'Hotel Bills';
      case 1:
        return 'Cost of Drugs';
      case 2:
        return 'Vehicles Running Expenses';
      case 3:
        return 'Air Ticket';
      case 4:
        return 'Night Allowances';
      case 5:
        return 'Kilometer claim';
      case 6:
        return 'Cost of Meal/Snacks';
      case 7:
        return 'Taxi Fares';
      case 8:
        return 'Others';
      default:
        return '';
    }
  }
}

/// Custom TextInputFormatter to limit words per line to a specific number
class WordLimitTextInputFormatter extends TextInputFormatter {
  final int wordLimitPerLine;

  WordLimitTextInputFormatter(this.wordLimitPerLine);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Split text into lines
    List<String> lines = newValue.text.split('\n');

    // Process each line
    List<String> formattedLines = [];
    for (String line in lines) {
      List<String> words = line.split(' ');

      // Split the line into multiple lines if it exceeds the word limit
      while (words.length > wordLimitPerLine) {
        formattedLines.add(words.take(wordLimitPerLine).join(' '));
        words = words.skip(wordLimitPerLine).toList();
      }
      formattedLines.add(words.join(' '));
    }

    // Join the lines back and return the updated text
    String finalText = formattedLines.join('\n');

    return newValue.copyWith(
      text: finalText,
      selection: TextSelection.collapsed(offset: finalText.length),
    );
  }
}

