import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';

class CashierDailyReports extends StatefulWidget {
  @override
  _CashierDailyReportsState createState() => _CashierDailyReportsState();
}

class _CashierDailyReportsState extends State<CashierDailyReports> {

  List<String> cashier = ['All', 'Admin'];
  String selection;
  var startDate;

  @override
  void initState() {
    super.initState();
    startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    Future.delayed(Duration(milliseconds: 800), (){
      showToast(
          'No Records Found',
          position: ToastPosition.center,
          backgroundColor: Theme.of(context).primaryColorDark,
          duration: Duration(seconds: 2),
          radius: 5.0
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4.0,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 75.0,
                          height: 60.0,
                          child: Card(
                            elevation: 2.0,
                            margin: EdgeInsets.only(top: 5.0),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                startDate.toString().substring(0, 10),
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 13.0
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60.0,
                          child: IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                              size: 55,
                              color: Colors.amber[500],
                            ),
                            onPressed: ()=> selectStartDate(context),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 45.0,
                          width: 80.0,
                          margin: EdgeInsets.only(top: 13.0),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.0)),
                              border: Border.all(
                                  color: Colors.brown[200], width: 1.0)),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                hint: Text(cashier[0]),
                                isExpanded: true,
                                value: selection,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.amber,
                                ),
                                iconSize: 25,
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
                        SizedBox(width: 3.0,),
                        Container(
                          height: 45.0,
                          margin: EdgeInsets.only(top: 13.0),
                          child: FlatButton(
                            onPressed: (){},
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
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

  void handleSelections(value) {
    setState(() {
      selection = value;
    });
  }

}
