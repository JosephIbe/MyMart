import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductWiseItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double totalSales = 2733.30;
    double sellingPrice = 455.55;
    double totalDiscount = 0.00;
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      margin: EdgeInsets.all(7.0),
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 0.0, bottom: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey, width: 1.0)),
      child: Column(
        children: <Widget>[
          Container(
            width: w,
            height: 25.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Product Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          ),
          SizedBox(height: 5.0,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Total Sales : NGN $totalSales',
                      style: TextStyle(
                          color: Colors.brown[200], fontSize: 14.0),
                    ),
                    Text(
                      'Selling Price : NGN $sellingPrice',
                      style: TextStyle(
                          color: Colors.brown[200], fontSize: 14.0),
                    ),
                    Text(
                      'Total Discount : NGN $totalDiscount',
                      style: TextStyle(
                          color: Colors.brown[200], fontSize: 14.0),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey, width: 1.0)
                ),
                child: Column(
                  children: <Widget>[
                    Text('3', style: TextStyle(
                        color: Colors.brown[200], fontSize: 14.0),),
                    Text('6', style: TextStyle(
                        color: Colors.amber[900], fontSize: 16.0),),
                    Text('Sold Qty', style: TextStyle(
                        color: Colors.brown[200],
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
