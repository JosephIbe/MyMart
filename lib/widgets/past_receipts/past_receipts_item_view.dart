import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PastReceiptsItemView extends StatefulWidget {
  final bool isViewReceipt;
  final VoidCallback toggleViewPastReceiptStatus;

  PastReceiptsItemView({this.isViewReceipt, this.toggleViewPastReceiptStatus});

  @override
  _PastReceiptsItemViewState createState() => _PastReceiptsItemViewState();
}

class _PastReceiptsItemViewState extends State<PastReceiptsItemView> {
  String email;
  final _emailController = TextEditingController();
  bool isMoreDetails;

  @override
  void initState() {
    isMoreDetails = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        width: w,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Receipt',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).primaryColorDark),
                ),
                GestureDetector(
                  onTap: widget.toggleViewPastReceiptStatus,
                  child: Text(
                    'Back',
                    style: TextStyle(
                        fontSize: 18.0,
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).primaryColorDark),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey[400],
            ),
            Container(
              width: w,
//              height: isMoreDetails == false ? 50.0 : 100.0,
              height: 90.0,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400], width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Product Name',
                            style: TextStyle(
                                color: Colors.brown[400], fontSize: 12.0),
                          ),
                          Text(
                            'Qty',
                            style: TextStyle(
                                color: Colors.brown[400], fontSize: 12.0),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(flex: 3, child: Container()),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '6 x 455.55',
                            style: TextStyle(
                                color: Colors.brown[400], fontSize: 12.0),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ' = 2733.30',
                            style: TextStyle(
                                color: Colors.brown[400], fontSize: 12.0),
                          )),
                    ],
                  ),
                  Text(
                    'Tax:\t0.00',
                    style: TextStyle(color: Colors.brown[400]),
                  ),
                  Text(
                    'Discount:\t(0.00)',
                    style: TextStyle(color: Colors.brown[400]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
//            Container(
//              width: w,
//              child: FlatButton(
//                color: Theme.of(context).primaryColorDark,
//                textColor: Colors.white,
//                onPressed: ()=> toggleFullDetails,
//                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
//                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
//                child: Text('Hide Details')),
//            ),
//            isMoreDetails == true ? Container()
//                : Container(
            Column(
              children: <Widget>[
                Container(
                  width: w,
                  height: 200.0,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400], width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        '${DateFormat().format(DateTime.now())}',
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.brown[600]),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'BILL # :\t1',
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.brown[600]),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Receipt #:\t1234567890',
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.brown[600]),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Cashier:\tAdmin',
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.brown[600]),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Customer:\tN/A',
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.brown[600]),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Sub Total (NGN):\t2733.30',
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.brown[600]),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Total Discount (NGN):\t0.00',
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.brown[600]),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Grand Total (NGN):\t2733.30',
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.brown[600]),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Payment Type:\tCash',
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.brown[600]),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Balance:\t0.00',
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.brown[600]),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: showEmailDialog,
                  child: Container(
                      width: w,
                      height: 56.0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400], width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Resend Email Receipt',
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.brown[600]),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 5.0),
                  child: FlatButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      onPressed: () {},
                      child: Text(
                        'Send',
                        style: TextStyle(fontSize: 15.0),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget showEmailDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 4.0,
      child: Text('hey'),
    );
//        child: Container(
//          padding: EdgeInsets.all(8.0),
//          child: Column(
//            children: <Widget>[
//              TextFormField(
//                controller: _emailController,
//                maxLines: 1,
//                decoration: InputDecoration(hintText: 'email address'),
//              )
//            ],
//          ),
//        ));
  }

  void toggleFullDetails() {
    print('imdv:\t$isMoreDetails');
    setState(() {
      isMoreDetails = !isMoreDetails;
    });
  }
}
