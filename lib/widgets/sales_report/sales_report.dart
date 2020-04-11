import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SalesReport extends StatefulWidget {
  @override
  _SalesReportState createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
//  List<String> reportType = ['Full', 'Item-wise'];
  List<String> reportType = ['Full',];
  List<String> cashier = ['All', 'Admin'];
  List<String> itemCode = ['All'];
  String reportSelection, cashierSelection, itemCodeSelection;
  var startDate;
  var endDate;

  @override
  void initState() {
    super.initState();
    startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4.0,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              buildHeaderDropDown('Revenue Report Type', reportType, reportType[0]),
              SizedBox(height: 5.0,),
              buildStartDatePicker('Start Date', startDate, ),
              SizedBox(height: 5.0,),
              buildEndDatePicker('End Date', endDate),
              SizedBox(height: 5.0,),
              buildHeaderDropDown('Cashier', cashier, cashier[0]),
              SizedBox(height: 5.0,),
              buildHeaderDropDown('Item Code', itemCode, itemCode[0]),
              SizedBox(height: 15.0,),
              buildReportsMetaData()
            ],
          ),
        )
      ),
    );
  }

  Widget buildReportsMetaData(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildMetaRowValues(
            title: 'Total Sold Qty', currency: '',
            amount: 6, color: Colors.brown[500], fontSize: 16.0,
        ),
        SizedBox(height: 3.0,),
        buildMetaRowValues(
          title: 'Sale Amount', currency: 'NGN', amount: 2733.30,
          color: Colors.brown[500], fontSize: 16.0,
        ),
        SizedBox(height: 3.0,),
        buildMetaRowValues(
          title: 'Total Discount', currency: 'NGN', amount: 0.00,
          color: Colors.brown[500],  fontSize: 16.0,
        ),
        SizedBox(height: 3.0,),
        buildMetaRowValues(
          title: 'Total Charges', currency: 'NGN', amount: 0.00,
          color: Colors.brown[500],  fontSize: 16.0,
        ),
        SizedBox(height: 3.0,),
        buildMetaRowValues(
          title: 'Total Sales', currency: 'NGN', amount: 2733.30,
          color: Colors.brown[500], fontSize: 16.0,
        ),
        SizedBox(height: 3.0,),
        buildMetaRowValues(
          title: 'Item Cost', currency: 'NGN', amount: 3333.30,
          color: Colors.brown[500], fontSize: 16.0,
        ),
        SizedBox(height: 3.0,),
        buildMetaRowValues(
          title: 'Return Value', currency: 'NGN', amount: 0.00,
          color: Colors.brown[500], fontSize: 16.0,
        ),
        SizedBox(height: 3.0,),
        buildMetaRowValues(
          title: 'Total Tax', currency: 'NGN', amount: 0.00,
          color: Colors.brown[500], fontSize: 16.0,
        ),
        SizedBox(height: 3.0,),
        buildMetaRowValues(
          title: 'Total Cost', currency: 'NGN', amount: 3333.30,
          color: Colors.brown[500], fontSize: 16.0,
        ),
        SizedBox(height: 3.0,),
        buildMetaRowValues(
          title: 'Profit', currency: 'NGN', amount: -600.00,
          color: Colors.amber[700], fontSize: 18.0,
        ),
        SizedBox(height: 3.0,),
      ],
    );
  }

  Widget buildMetaRowValues({String title, String currency, double amount,
        Color color, double fontSize}){
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            '$title',
            style: TextStyle(color: color, fontSize: fontSize),
          ),
        ),
        Expanded(
          child: Text(
            '$currency\t$amount',
            style: TextStyle(color: color, fontSize: fontSize),
          ),
        ),
      ],
    );
  }

  Widget buildStartDatePicker(String title, var startDate){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.brown[500], fontSize: 16.0),
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Card(
                  elevation: 2.0,
                  margin: EdgeInsets.only(top: 5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      startDate.toString().substring(0, 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5.0),
              child: IconButton(
                icon: Icon(
                  Icons.calendar_today,
                  size: 45,
                  color: Colors.amber[500],
                ),
                onPressed: ()=> selectStartDate(context),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildEndDatePicker(String title, var startDate){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.brown[500], fontSize: 16.0),
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Card(
                  elevation: 2.0,
                  margin: EdgeInsets.only(top: 5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      startDate.toString().substring(0, 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5.0),
              child: IconButton(
                icon: Icon(
                  Icons.calendar_today,
                  size: 45,
                  color: Colors.amber[500],
                ),
                onPressed: ()=> selectEndDate(context),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildHeaderDropDown(String title, List<String> items, String hintText){
    print(reportSelection);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.brown[500], fontSize: 16.0),
        ),
        SizedBox(height: 8.0,),
        Container(
          height: 35.0,
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(
                  color: Colors.brown[200], width: 1.0)),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                hint: Text(hintText),
                isExpanded: true,
                value: reportSelection,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.brown,
                ),
                iconSize: 35,
                onChanged: handleReportSelections,
                items: items.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void handleReportSelections(value) {
    setState(() {
      reportSelection = value;
    });
  }

  void handleCashierSelections(value) {
    setState(() {
      cashierSelection = value;
    });
  }

  void handleItemCodeSelections(value) {
    setState(() {
      itemCodeSelection = value;
    });
  }

  void selectStartDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        startDate = pickedDate;
      });
    });
  }

  void selectEndDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        endDate = pickedDate;
      });
      print('endDate:\t$endDate');
    });
  }

}