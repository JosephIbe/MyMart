import 'package:flutter/material.dart';

class ProductsCard extends StatefulWidget {

  @override
  _ProductsCardState createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {

  final _imageKey = GlobalKey();
  Size imageSize;
  Offset imagePosition;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getImageSizeAndPosition());
  }

  getImageSizeAndPosition(){
    RenderBox _imageBox = _imageKey.currentContext.findRenderObject();
    imageSize = _imageBox.size;
    imagePosition = _imageBox.localToGlobal(Offset.zero);
    print('image size\t$imageSize');
    print('image coords\t$imagePosition');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                key: _imageKey,
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
}
