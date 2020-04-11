import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_mart/widgets/past_receipts/past_receipts_item.dart';
import 'package:g_mart/widgets/past_receipts/past_receipts_item_view.dart';
import 'package:intl/intl.dart';

class PastReceipts extends StatefulWidget {
  @override
  _PastReceiptsState createState() => _PastReceiptsState();
}

class _PastReceiptsState extends State<PastReceipts> {
  List<String> cashier = ['All', 'Admin'];
  String selection;
  var startDate;
  var endDate;
  bool isViewReceipt;
  double totalSales = 0.00;

  @override
  void initState() {
    super.initState();
    isViewReceipt = false;
    startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Expanded(
      child: receiptsList(context, w, h),
    );
  }

  void toggleViewPastReceiptStatus(){
    setState(() {
      isViewReceipt = !isViewReceipt;
    });
  }

  Widget pastReceiptsView(){
    return PastReceiptsItemView(
      isViewReceipt: isViewReceipt,
      toggleViewPastReceiptStatus: toggleViewPastReceiptStatus,
    );
  }

  Widget receiptsList(BuildContext context, double width, double height){
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 600),
      child: isViewReceipt == false ? Card(
        elevation: 4.0,
        child: Container(
          width: width,
          height: height,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: Row(
                          children: <Widget>[
                            Card(
                              elevation: 2.0,
                              margin: EdgeInsets.only(top: 5.0),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Text(startDate.toString().substring(0, 10)),
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
                        )),
                    Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.only(left: 8.5),
                          child: Row(
                            children: <Widget>[
                              Card(
                                elevation: 2.0,
                                margin: EdgeInsets.only(top: 5.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Text(endDate.toString().substring(0, 10)),
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
                        )),
                  ],
                ),
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
                        onPressed: queryPastReceipts,
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
              Expanded(
                  child: Stack(
                    children: <Widget>[
                      ListView(
                          children: <Widget>[
//                            pastReceiptsItem(),
                            PastReceiptsItem(
                                isViewReceipt: isViewReceipt,
                                toggleViewPastReceiptStatus: toggleViewPastReceiptStatus
                            ),
                            PastReceiptsItem(
                                isViewReceipt: isViewReceipt,
                                toggleViewPastReceiptStatus: toggleViewPastReceiptStatus
                            ),
                            PastReceiptsItem(
                                isViewReceipt: isViewReceipt,
                                toggleViewPastReceiptStatus: toggleViewPastReceiptStatus
                            ),
                            PastReceiptsItem(
                                isViewReceipt: isViewReceipt,
                                toggleViewPastReceiptStatus: toggleViewPastReceiptStatus
                            ),
                          ]
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
                  )),
            ],
          ),
        ),
      ) : pastReceiptsView(),
    );
  }

  void handleSelections(value) {
    setState(() {
      selection = value;
    });
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

  void queryPastReceipts() {
  }
}
