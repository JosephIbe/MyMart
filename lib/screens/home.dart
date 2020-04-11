import 'package:flutter/material.dart';
import 'package:g_mart/utils/constants.dart';
import 'package:g_mart/widgets/main_drawer.dart';
import 'package:g_mart/widgets/home/products_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  double total = 0.00;
  double sub_total = 0.00;
  double total_discount = 0.00;

  int billNum = 1;
  int qty = 0;
  int numItems = 0;

  String role = 'Admin';

  int cartItemsCount = 0;
  bool hasEmptyCart = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.amber[700],
          title: Container(
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Sub Total (NGN): $sub_total',
                      style: TextStyle(color: Colors.white, fontSize: 11.0),
                    ),
                    Text(
                      'Total Discount (NGN): $total_discount',
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'TOTAL (NGN)',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '$total',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          )),
      drawer: MainDrawer(role: role),
      body: Stack(
        children: <Widget>[
          Container(
            width: w,
            height: h,
            margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    stops: [
                  0.1,
                  0.75,
                  1
                ],
                    colors: [
                  Color(0xFFffffff),
                  Color(0xFFffe9bf),
                  Color(0xFFffd280),
                ])),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                /**
                     *  Cart ? Empty : ItemsInCart
                     * **/
//                hasEmptyCart ? emptyCart(w) : myCart(w),
                hasEmptyCart
                    ? Card(
                        elevation: 2.0,
                        child: Container(
                            width: w,
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Empty Cart',
                                )
                              ],
                            )),
                      )
                    : Card(
                        elevation: 2.0,
                        child: Container(
                          width: w,
                          height: 50.0,
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
//                              Row(
//                                children: <Widget>[
//                                  Text('Item Cart'),
//                                  SizedBox(
//                                    width: 5.0,
//                                  ),
//                                  Container(
//                                    key: _cartKey,
//                                    height: 48.0,
//                              decoration: BoxDecoration(
//                                  border: Border(
//                                    bottom: BorderSide(color: Colors.amber[400], width: 1.0),
//                                    left: BorderSide(color: Colors.amber[400], width: 1.5),
//                                  )
//                              ),
//                                  )
//                                ],
//                              ),
                              Text('Item Cart'),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1.5,
                                            color: Colors.amber[600]),
                                        left: BorderSide(
                                            width: 1.5,
                                            color: Colors.amber[600]))),
                                child: Container(
                                  height: 45.0,
                                  width: 45.0,
                                  margin:
                                      EdgeInsets.only(left: 1.5, bottom: 1.5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2.0,
                                          color: Colors.amber[600])),
                                  child: Center(
                                    child: Text(
                                      '$cartItemsCount',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                /**
                     *  Items Grid
                     * **/
                Expanded(
                  //todo add click listeners for products card
                  child: SingleChildScrollView(
                    child: GestureDetector(
                      onTap: incrementCartCount,
                      child: productsCard(),
                    ),
                    physics: AlwaysScrollableScrollPhysics(),
                  ),
                ),
                /**
                     *  Bottom Controls
                     * **/
                bottomControls(),
              ],
            ),
          ),
          role == 'Admin' || role == 'SuperUser'
              ? Positioned(
                  right: 20,
                  bottom: 95,
                  child: FloatingActionButton(
                    onPressed: () => Navigator.pushNamed(
                        context, allProductsRoute,
                        arguments: role),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.brown,
                  ),
                )
              : Container()
        ],
      ),
    ));
  }

  void incrementCartCount() {
    setState(() => hasEmptyCart = false);
    cartItemsCount++;
  }

  Widget productsCard(){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 5.0
      ),
      itemCount: 1,
      itemBuilder: (context, index){
        return Card(
          elevation: 4.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
//                        'NGN ${allProducts[position].sellingCost}',
                      'NGN 250',
                      style: TextStyle(color: Colors.green, fontSize: 11.0),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.amberAccent
                      ),
                      child: IconButton(
                          icon: Icon(Icons.more_horiz, color: Colors.white, size: 10,),
                          onPressed: (){}
                      ),
                    )
                  ],
                ),
              ),
              Expanded(child:
              Padding(
//                key: _imageKey,
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                //                  child: Image.network('${allProducts[position].image}',
                child: Icon(Icons.shopping_cart, size: 60,),
              )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4.0,8.0, 0, 8.0),
                child: Text(
//                    allProducts[position].name,
                  'Groundnut',
                  style: TextStyle(color: Colors.green),
                ),
              )
            ],
          ),
        );
      },
      shrinkWrap: true,
    );
  }

  Widget bottomControls() {
    return Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 58,
                  decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      Text(
                        'Extras',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 58,
                  decoration: BoxDecoration(
                      color: Colors.red[300],
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                      ),
                      Text(
                        'Discard',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 58,
                  decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.local_printshop,
                        color: Colors.white,
                      ),
                      Text(
                        'Discount',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 58,
                  decoration: BoxDecoration(
                      color: Colors.purple[300],
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        'Order Types',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.payment,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        'Payment',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'BILL #$billNum',
                    style: TextStyle(color: Colors.brown),
                  ),
                  Text(
                    'Qty : $qty',
                    style: TextStyle(color: Colors.brown),
                  ),
                  Text(
                    '# Items : $numItems',
                    style: TextStyle(color: Colors.brown),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Text(
                'Customer: N/A',
                style: TextStyle(color: Colors.brown),
              ),
            )
          ],
        ));
  }
}
