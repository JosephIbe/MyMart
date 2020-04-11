import 'package:flutter/material.dart';
import 'package:g_mart/models/products.dart';
import 'package:g_mart/widgets/products/add_option_view.dart';
import 'package:g_mart/widgets/products/create_product.dart';
import 'package:g_mart/widgets/products/product_info.dart';
import 'package:g_mart/widgets/products/product_tile.dart';

class ProductsList extends StatefulWidget {

  final String role;
  ProductsList({this.role});

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {

  List<Products> allProductsList = [];
  double screenWidth, screenHeight;

  String prodId;

  bool isShowProductsForm = false;
  bool isShowProdInfo = false;
  bool isInEditMode = false;

  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: allProductsList.length == 0 ? emptyList() : productsWidget(),
        ),
      ),
    );
  }

  Widget emptyList() {
    return AddOptionView();
  }

  Widget productsWidget() {
    return Container(
        width: screenWidth,
        height: screenHeight,
        margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.6, 1],
              colors: [
                Color(0xFFffffff),
                Color(0xFFffe9bf),
                Color(0xFFffd280),
              ]
          ),
        ),
        child: isShowProductsForm == false ? Stack(
          children: <Widget>[
            allProducts(),
            toggleAddProductFAB()
          ],
        )
            : CreateProduct(
            isShowProductsForm: isShowProductsForm,
            changeViews: changeViews,
            isInEditMode: isInEditMode,
            toggleEditMode: toggleEditMode
        )
    );
  }

  Widget toggleAddProductFAB(){
    if (isShowProdInfo == false && widget.role == 'Admin' || widget.role == 'SuperUser'){
      return Positioned(
          bottom: 40,
          right: 10,
          child: FloatingActionButton(
            onPressed: changeViews,
            backgroundColor: Colors.brown,
            child: Icon(Icons.add),
          )
      );
    } else {
      return Container();
    }
  }

  Widget allProducts() {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 400),
      child: isShowProdInfo == false
          ? Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: ListView.builder(
          itemCount: allProductsList.length,
          itemBuilder: (context, position){
            prodId = allProductsList[position].productId;
            return ProductTile(
                product: allProductsList[position],
                toggleViewInfo: toggleViewInfo,
                productId: prodId
            );
          },
        ),
      ) :
      ProductInfo(
          isShowProdInfo: isShowProdInfo,
          toggleViewInfo: toggleViewInfo,
          productId: prodId,
          isInEditMode: isInEditMode,
          toggleEditMode: toggleEditMode
      ),
    );
  }

  void changeViews() {
    setState(() {
      isShowProductsForm = !isShowProductsForm;
      isShowProdInfo = !isShowProdInfo;
    });
  }

  void toggleViewInfo() {
    setState(() {
      isShowProdInfo = !isShowProdInfo;
      print('ispi val after ss call:\t$isShowProdInfo');
    });
  }

  void toggleEditMode(){
    setState(() {
      isInEditMode = !isInEditMode;
      print('isiem val after ss call:\t$isInEditMode');
    });
  }

}
