import 'package:flutter/material.dart';
import 'package:g_mart/models/products.dart';

class ProductTile extends StatelessWidget {

  final Products product;
  final String productId;
  final bool isShowProdInfo;
  final VoidCallback toggleViewInfo;

  ProductTile({
    @required this.product,
    @required this.productId,
    this.isShowProdInfo,
    this.toggleViewInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Column(
        children: <Widget>[
          Container(
              height: 100,
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber[400],
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(product.name, style: TextStyle(color: Colors.white),),
                        SizedBox(width: 5.0,),
                        IconButton(
                          icon: Icon(Icons.star_border),
                          onPressed: (){
                          },
                          color: Colors.white,
                          iconSize: 40,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                                child: Text(
//                                  product.category,
                                  'Cat101',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                              Container(
                                color: Colors.brown[400],
                                width: 2.0,
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                                child: Text(
                                  'NGN: ${product.sellingPrice}',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          RaisedButton(
                            onPressed: (){
                              toggleViewInfo();
                              print('hey ispi new val:\t$isShowProdInfo && pid is $productId');
                            },
                            color: Colors.brown[400],
                            child: Text('VIEW'),
                          )
                        ],
                      )
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
