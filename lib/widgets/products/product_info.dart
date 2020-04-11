import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_mart/models/products.dart';
import 'package:g_mart/utils/constants.dart';

class ProductInfo extends StatefulWidget {

  final String productId;
  final bool isShowProdInfo;
  final bool isInEditMode;
  final VoidCallback toggleViewInfo;
  final VoidCallback toggleEditMode;

  ProductInfo(
      {@required this.productId,
        @required this.isShowProdInfo,
        @required this.isInEditMode,
        this.toggleViewInfo,
        this.toggleEditMode,
      });

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {

  Products single;

  @override
  void initState() {
    super.initState();

//    DocumentReference reference = Firestore.instance.collection(PRODUCTS_REF)
//        .reference().document(widget.productId);
//    reference.snapshots().listen((p){
//      setState(() {
//        single = Products.fromSnapshot(p);
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            basicDetails(),
            moreDetails(),
            imageCard(),
            SizedBox(height: 65.0,),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 1.0,
          left: 1.0,
          child: actionOptions(),
        )
      ],
    );
  }

  Widget basicDetails(){
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Product Information',
                  style: TextStyle(
                      color: Colors.brown[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                ),
                GestureDetector(
                  onTap: () {
                    print(
                        'view clicked and info value is\t${widget.isShowProdInfo}');
                    widget.toggleViewInfo();
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 2.0,
                color: Colors.blueGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Product Code'),
                  Text('${single.productCode}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Name'),
                  Text('${single.name}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Category'),
//                  Text('${single.category}'),
                  Text('Cat101'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Selling Price (NGN)'),
                  Text('${single.sellingPrice}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Status'),
//                  Text('${single.status}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Favorite Item'),
                  Text('${single.isFavorite}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget moreDetails(){
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'More Details',
              style: TextStyle(
                  color: Colors.brown[400],
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Container(
                height: 2.0,
                color: Colors.blueGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Regular Cost (NGN)'),
                  Text('${single.costPerUnit}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Measurement'),
                  Text('${single.measurementUnit}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Product Expiry Date'),
//                  Text('${single.productExpiryDate}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageCard(){
    return Card(
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
//                        image: NetworkImage(single.imageUrl),
                        image: NetworkImage('https://imgur.com/gallery/K5VqR4a'),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget actionOptions(){
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: (){},
                shape: RoundedRectangleBorder(borderRadius:
                BorderRadius.all(Radius.circular(5.0)
                )
                ),
                color: Colors.blue[700],
                textColor: Colors.white,
                child: Text('EDIT'),
              ),
              RaisedButton(
                onPressed: (){},
                shape: RoundedRectangleBorder(borderRadius:
                BorderRadius.all(Radius.circular(5.0)
                )
                ),
                color: Colors.brown[200],
                textColor: Colors.white,
                child: Text('DISABLE'),
              ),
              RaisedButton(
                onPressed: (){},
                shape: RoundedRectangleBorder(borderRadius:
                BorderRadius.all(Radius.circular(5.0)
                )
                ),
                color: Colors.red[400],
                textColor: Colors.white,
                child: Text('DELETE'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
