import 'package:flutter/material.dart';
import 'package:g_mart/widgets/products/all_products.dart';

class ProductsCatalog extends StatefulWidget {

  final String role;
  ProductsCatalog({this.role});

  @override
  _ProductsCatalogState createState() => _ProductsCatalogState();
}

class _ProductsCatalogState extends State<ProductsCatalog> {

  List<String> stockSelectOptions = [
    'Create Products', 'Product Categories', 'More Options'
  ];
  String selectedOption;

  bool _viewAllProducts = true;
  bool _productCategories = false;
//  bool _moreOptions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: ()=> Navigator.of(context).pop(),
          color: Colors.white,
        ),
        title: Text('Inventory'),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(color: Colors.amber[300], width: 1.0),
              ),
              padding: EdgeInsets.fromLTRB(0, 2.0, 0, 2.0),
              margin: EdgeInsets.only(top: 5.0),
              child: DropdownButtonHideUnderline(
                  child: Container(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        value: selectedOption,
                        hint: Text(stockSelectOptions[0]),
                        isExpanded: true,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.amber[700],
                        ),
                        iconSize: 40,
                        onChanged: handleSelections,
                        items: stockSelectOptions.map((option) {
                          return DropdownMenuItem(
                              value: option,
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 4.0, 0.0, 0.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                  ),
                                  child: Text(option)
                              )
                          );
                        }).toList(),
                      ),
                    ),
                  )
              ),
            ),
            renderFromSelections()
          ],
        ),
      ),
    );
  }

  void handleSelections(String value) {
    setState(() {
      selectedOption = value;
    });
    switch(selectedOption){
      case 'Create Products':
        setState(() {
          _viewAllProducts = true;
          _productCategories = false;
        });
        break;
      case 'Product Categories':
        setState(() {
          _productCategories = true;
          _viewAllProducts = false;
        });
        break;
    }
  }

  renderFromSelections() {
    if (_viewAllProducts) {
      return ProductsList(role: widget.role);
    }
//    else if (_productCategories) {
//      return Categories();
//    } else {
//      return Container();
    }

}


