import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_textfieild.dart';

class MyDatatable extends StatelessWidget {
   MyDatatable({super.key});
  final TextEditingController NatureofExpensesController = TextEditingController();
  final TextEditingController tablequantityController = TextEditingController();
  final TextEditingController tablereceiptController = TextEditingController();
  final TextEditingController tableamountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2,),
        shape: BoxShape.rectangle,
      ),clipBehavior: Clip.antiAlias,
        columns: [
          DataColumn(label: Text("S/N")),
          DataColumn(label: Text("Expense Description")),
          DataColumn(label: Text("Nature of Expenses")),
          DataColumn(label: Text("Quantity ")),
          DataColumn(label: Text("Receipt Number")),
          DataColumn(label: Text("Amount")),
        ],
        rows: [
          DataRow(cells: [DataCell(Text('1')), DataCell(Text('Hotel Bills'),), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablequantityController,keyboardType: TextInputType.number, maxLines: 2,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
          ))]),
          DataRow(cells: [DataCell(Text('2')), DataCell(Text('Cost of Drugs')), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablequantityController,keyboardType: TextInputType.number, maxLines: 2,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
          ))]),
          DataRow(cells: [DataCell(Text('3')), DataCell(Text('Vehicles Running Expenses')), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablequantityController, keyboardType: TextInputType.number,maxLines: 2,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
          ))]),
          DataRow(cells: [DataCell(Text('4')), DataCell(Text('Air Ticket')), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablequantityController, keyboardType: TextInputType.number,maxLines: 2,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
          ))]),
          DataRow(cells: [DataCell(Text('5')), DataCell(Text('Night Allowances')), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablequantityController,keyboardType: TextInputType.number, maxLines: 2,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablereceiptController, keyboardType: TextInputType.number,maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
          ))]),
          DataRow(cells: [DataCell(Text('6')), DataCell(Text('Kilometer claim')), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablequantityController,keyboardType: TextInputType.number, maxLines: 2,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "0", controller: tableamountController, keyboardType: TextInputType.number,maxLines: 2, inputFormatters: []),
          ))]),
          DataRow(cells: [DataCell(Text('7')), DataCell(Text('Cost of Meal/Snacks')), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablequantityController,keyboardType: TextInputType.number, maxLines: 2,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablereceiptController, keyboardType: TextInputType.number,maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
          ))]),
          DataRow(cells: [DataCell(Text('8')), DataCell(Text('Taxi Fares')), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablequantityController, keyboardType: TextInputType.number,maxLines: 2,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablereceiptController,keyboardType: TextInputType.number, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
          ))]),
          DataRow(cells: [DataCell(Text('9')), DataCell(Text('Others')), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: NatureofExpensesController, maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablequantityController, keyboardType: TextInputType.number,maxLines: 2,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "", controller: tablereceiptController, keyboardType: TextInputType.number,maxLines: 3, inputFormatters: []),
          )), DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(label: "0", controller: tableamountController,keyboardType: TextInputType.number, maxLines: 2, inputFormatters: []),
          ))]),
        ],
      ),
    );
  }
}
