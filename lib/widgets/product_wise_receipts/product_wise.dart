import 'package:flutter/material.dart';
import 'package:g_mart/widgets/product_wise_receipts/product_wise_item.dart';
import 'package:intl/intl.dart';

class ProductWiseReports extends StatefulWidget {
  @override
  _ProductWiseReportsState createState() => _ProductWiseReportsState();
}

class _ProductWiseReportsState extends State<ProductWiseReports> {

  List<String> cashier = ['All', 'Admin'];
  String selection;
  var startDate;
  var endDate;
  double totalSales = 0.00;

  @override
  void initState() {
    super.initState();
    startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    totalSales = 2733.30;
  }

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Expanded(
      child: Card(
        elevation: 4.0,
        child: Container(
          width: w,
          height: h,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 7,
                            child: Row(
                              children: <Widget>[
                                Text('Start Date'),
                                SizedBox(width: 8.0,),
                                Expanded(
                                    child: Card(
                                      elevation: 2.0,
                                      margin: EdgeInsets.only(top: 5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Text(startDate.toString().substring(0, 10)),
                                      ),
                                    )
                                )
                              ],
                            ),
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
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 7,
                            child: Row(
                              children: <Widget>[
                                Text('End Date'),
                                SizedBox(width: 15.0,),
                                Expanded(
                                    child: Card(
                                      elevation: 2.0,
                                      margin: EdgeInsets.only(top: 5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Text(endDate.toString().substring(0, 10)),
                                      ),
                                    )
                                )
                              ],
                            ),
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
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Container(
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
                              hint: Text('Select Cashier'),
                              isExpanded: true,
                              value: selection,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.brown,
                              ),
                              iconSize: 35,
                              onChanged: handleSelections,
                              items: cashier.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Expanded(
                      flex: 4,
                      child: FlatButton(
                        onPressed: queryProductWiseReceipts,
                        color: Colors.amber[500],
                        textColor: Colors.white,
                        child: Text('SEARCH'),
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0))),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                  child: Stack(
                    children: <Widget>[
                      ListView(
                        children: <Widget>[
                          ProductWiseItem()
                        ],
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: RaisedButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(horizontal: 80.0),
                          elevation: 4.0,
                          color: Colors.white,
                          textColor: Colors.brown,
                          child: Text('Total Sales: NGN $totalSales'),
                        ),
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      )
    );
  }

  void selectStartDate(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now()
    ).then((pickedDate){
      if(pickedDate == null)
        return;
      setState(() {
        startDate = pickedDate;
      });
    });
  }

  void handleSelections(value) {
    setState(() {
      selection = value;
    });
  }

  void selectEndDate(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now()
    ).then((pickedDate){
      if(pickedDate == null)
        return;
      setState(() {
        endDate = pickedDate;
      });
      print('endDate:\t$endDate');
    });
  }

  void queryProductWiseReceipts() {}
}
