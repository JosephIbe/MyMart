import 'package:flutter/material.dart';
import 'package:g_mart/widgets/sales_report/cash_refunds.dart';
import 'package:g_mart/widgets/sales_report/cashier_daily_sales.dart';
import 'package:g_mart/widgets/sales_report/category_wise.dart';
import 'package:g_mart/widgets/sales_report/credit_notes.dart';
import 'package:g_mart/widgets/past_receipts/past_receipts.dart';
import 'package:g_mart/widgets/product_wise_receipts/product_wise.dart';
import 'package:g_mart/widgets/sales_report/sales_report.dart';

class AllSalesReports extends StatefulWidget {
  @override
  _AllSalesReportsState createState() => _AllSalesReportsState();
}

class _AllSalesReportsState extends State<AllSalesReports> {

  List<String> salesOptions = [
    'View Past Receipts',
    'Product Wise Sales Report',
    'Sales Reports',
    'Category Wise Sales Report',
    'Cashier Daily Sales Report',
    'View Cash Refunds',
    'View Past Credit Notes',
//    'More Reports'
  ];
  String selection;

  bool _viewPastRcpts = true;
  bool _prodWiseSalesReports = false;
  bool _salesReports = false;
  bool _categoryWiseReports = false;
  bool _cashierDailyReports = false;
  bool _viewCashRefunds = false;
  bool _viewPastCreditNotes = false;
//  bool _moreReports = false;

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: ()=> Navigator.of(context).pop(),
          color: Colors.white,
        ),
        title: Text('Sales Reports', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          Icon(
            Icons.local_printshop,
            color: Colors.white,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        width: w,
        height: h,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.amber, width: 1.0)),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    hint: Text(salesOptions[0]),
                    isExpanded: true,
                    value: selection,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.amber[700],
                    ),
                    iconSize: 40,
                    onChanged: handleSelections,
                    items: salesOptions.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Text(item),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            buildSelectedOption()
          ],
        ),
      ),
    );
  }

  void handleSelections(String value) {
    setState(() => selection = value);
    print(selection);
    switch (selection) {
      case 'View Past Receipts':
        setState(() {
          _viewPastRcpts = true;
          _prodWiseSalesReports = false;
          _salesReports = false;
          _categoryWiseReports = false;
          _cashierDailyReports = false;
          _viewCashRefunds = false;
          _viewPastCreditNotes = false;
        });
        break;
      case 'Product Wise Sales Report':
        setState(() {
          _prodWiseSalesReports = true;
          _viewPastRcpts = false;
          _salesReports = false;
          _categoryWiseReports = false;
          _cashierDailyReports = false;
          _viewCashRefunds = false;
          _viewPastCreditNotes = false;
        });
        break;
      case 'Sales Reports':
        setState(() {
          _salesReports = true;
          _viewPastRcpts = false;
          _prodWiseSalesReports = false;
          _categoryWiseReports = false;
          _cashierDailyReports = false;
          _viewCashRefunds = false;
          _viewPastCreditNotes = false;
        });
        break;
      case 'Category Wise Sales Report':
        setState(() {
          _categoryWiseReports = true;
          _viewPastRcpts = false;
          _prodWiseSalesReports = false;
          _salesReports = false;
          _cashierDailyReports = false;
          _viewCashRefunds = false;
          _viewPastCreditNotes = false;
        });
        break;
      case 'Cashier Daily Sales Report':
        setState(() {
          _cashierDailyReports = true;
          _viewPastRcpts = false;
          _prodWiseSalesReports = false;
          _salesReports = false;
          _categoryWiseReports = false;
          _viewCashRefunds = false;
          _viewPastCreditNotes = false;
        });
        break;
      case 'View Cash Refunds':
        setState(() {
          _viewCashRefunds = true;
          _viewPastRcpts = false;
          _prodWiseSalesReports = false;
          _salesReports = false;
          _categoryWiseReports = false;
          _cashierDailyReports = false;
          _viewPastCreditNotes = false;
        });
        break;
      case 'View Past Credit Notes':
        setState(() {
          _viewPastCreditNotes = true;
          _viewPastRcpts = false;
          _prodWiseSalesReports = false;
          _salesReports = false;
          _categoryWiseReports = false;
          _cashierDailyReports = false;
          _viewCashRefunds = false;
        });
        break;
//      case 'More Reports':
//        setState(() {
//          _moreReports = true;
//          _viewPastRcpts = false;
//          _prodWiseSalesReports = false;
//          _salesReports = false;
//          _categoryWiseReports = false;
//          _cashierDailyReports = false;
//          _viewCashRefunds = false;
//          _viewPastCreditNotes = false;
//        });
//        break;
    }
  }

  buildSelectedOption() {
    if (_viewPastRcpts) {
      return PastReceipts();
    } else if (_prodWiseSalesReports) {
      return ProductWiseReports();
    } else if (_salesReports) {
      return SalesReport();
    } else if (_categoryWiseReports) {
      return CategoryWise();
    } else if (_cashierDailyReports) {
      return CashierDailyReports();
    } else if (_viewCashRefunds) {
      return ViewCashRefunds();
    } else if (_viewPastCreditNotes) {
      return ViewPastCreditNotes();
//    } else if (_moreReports) {
      //todo Push to more reports screen
    }
  }

}
