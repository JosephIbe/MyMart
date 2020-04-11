import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PastReceiptsItem extends StatelessWidget {

  final bool isViewReceipt;
  final VoidCallback toggleViewPastReceiptStatus;

  PastReceiptsItem({this.isViewReceipt, this.toggleViewPastReceiptStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 130.0,
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(4.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 25.0,
                margin: EdgeInsets.symmetric(vertical: 4.0),
                padding: EdgeInsets.all(4.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: Text('Receipt #: 1234567890', maxLines: 1, style: TextStyle(color: Colors.white),)
              ),
              SizedBox(height: 3.0,),
              Text('Date:\t${DateFormat().format(DateTime.now())}'),
              SizedBox(height: 3.0,),
              Text('Customer:\tN/A'),
              SizedBox(height: 3.0,),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text('Amount NGN:\t 34560.9')
                  ),
                  FlatButton(
                    onPressed: toggleViewPastReceiptStatus,
                    child: Text('VIEW'),
                    padding: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    color: Theme.of(context).primaryColorDark,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
