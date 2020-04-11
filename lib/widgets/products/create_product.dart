import 'dart:io';

import 'package:flutter/material.dart';
import 'package:g_mart/utils/styles.dart';
import 'package:image_picker/image_picker.dart';

class CreateProduct extends StatefulWidget {

  final bool isShowProductsForm;
  final bool isInEditMode;
  final VoidCallback toggleEditMode;
  final VoidCallback changeViews;

  CreateProduct({
    @required this.isShowProductsForm,
    @required this.isInEditMode,
    this.toggleEditMode,
    this.changeViews
  });

  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {

  List _categories = ['Food', 'Drinks'];
  String _selectedCategory;

  List _productUnits = ['N/A', 'litres', 'kg', 'g', 'pounds(lb)'];
  String _selectedProductUnit;

  bool isMoreVisible = false;
  bool isAddingProduct = false;
  bool isUrlReady = false;

  String url;
  File _prodImage;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _regUnitPriceController = TextEditingController();
  TextEditingController _sellingPriceController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _prodImage = null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(children: <Widget>[
          Card(
            elevation: 4.0,
            child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Add Product',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () => widget.changeViews(),
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
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Container(
                          height: 2.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text('*Product Name'),
                      ),
                      TextFormField(
                        controller: _nameController,
                        maxLines: 1,
                        decoration: formInputDecors,
                        validator: (String value) {
                          return value.isEmpty
                              ? 'Product Name is Required'
                              : null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text('*Product Code'),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              controller: _codeController,
                              maxLines: 1,
                              decoration: formInputDecors.copyWith(
                                  hintText: 'Eg: FD001'),
                              validator: (String value) {
                                return value.isEmpty
                                    ? 'Product Code is Required'
                                    : null;
                              },
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                            flex: 3,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text('*Category'),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 5.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                                  border: Border.all(
                                      color: Colors.brown[400], width: 1.0)),
                              child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton(
                                      elevation: 2,
                                      isExpanded: true,
                                      value: _selectedCategory,
                                      hint: Text('SELECT'),
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.brown[400],
                                      ),
                                      iconSize: 40.0,
                                      onChanged: handleCategorySelection,
                                      items: _categories.map((category) {
                                        return DropdownMenuItem(
                                          value: category,
                                          child: Container(
                                            height: 50,
                                            alignment: Alignment.centerLeft,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                            child: Text(category),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            flex: 2,
                            child: RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                              color: Colors.brown[800],
                              textColor: Colors.white,
                              child: Text(
                                'NEW',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 5,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child:
                                        Text('*Regular Unit Price (#NGN)'),
                                      )),
                                  TextFormField(
                                    controller: _regUnitPriceController,
                                    maxLines: 1,
                                    decoration: formInputDecors,
                                    validator: (String value) {
                                      return value.isEmpty
                                          ? 'Unit Price is Required'
                                          : null;
                                    },
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              )),
                          Expanded(
                            flex: 3,
                            child: _prodImage == null
                                ? Container(
                              margin: EdgeInsets.all(10.0),
                              height: 75.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.camera_enhance,
                                    color: Colors.amber,
                                    size: 60.0,
                                  ),
                                  onPressed: _addProductImage
                              ),
                            )
                                : GestureDetector(
                              onTap: _addProductImage,
                              child: Container(
                                height: 75.0,
                                width: 150.0,
                                margin: EdgeInsets.only(left: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                ),
                                child: Image.file(_prodImage,),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ])),
          ),
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () => setState(() => isMoreVisible = !isMoreVisible),
            child: Card(
                elevation: 4.0,
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'More Details',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.brown),
                            ),
                            Icon(
                              isMoreVisible
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              size: 30.0,
                              color: Colors.amberAccent,
                            )
                          ],
                        ),
                        Visibility(
                            visible: isMoreVisible,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  height: 1.0,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text('*Price (#NGN)'),
                                ),
                                TextFormField(
                                  controller: _sellingPriceController,
                                  maxLines: 1,
                                  decoration: formInputDecors.copyWith(
                                      hintText: 'Selling Price'),
                                  validator: (String value) {
                                    return value.isEmpty
                                        ? 'Selling price is required'
                                        : null;
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text('Unit of Measurement'),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 5,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 2.0, 0.0, 2.0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.amber[600])),
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton(
                                                elevation: 0,
                                                value: _selectedProductUnit,
                                                hint: Text(_productUnits[0]),
                                                isExpanded: true,
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.amber[600],
                                                ),
                                                iconSize: 40.0,
                                                onChanged:
                                                handleProductUnitSelection,
                                                items:
                                                _productUnits.map((unit) {
                                                  return DropdownMenuItem(
                                                    value: unit,
                                                    child: Container(
                                                      alignment:
                                                      Alignment.centerLeft,
                                                      child: Text(unit),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: RaisedButton(
                                        onPressed: (){},
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        color: Colors.amber[800],
                                        textColor: Colors.white,
                                        child: Text(
                                          'NEW',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ))),
          ),
          SizedBox(
            height: 20.0,
          ),
          Card(
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  elevation: 2.0,
                  color: Colors.brown[600],
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text('SAVE'),
                  onPressed: saveProduct,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void handleCategorySelection(value) {
    setState(() {
      _selectedCategory = value;
    });
  }

  void handleProductUnitSelection(value) {
    setState(() {
      _selectedProductUnit = value;
    });
  }

  Future<void> _addProductImage() async {
    var selectedImage =  await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(()=> _prodImage = selectedImage );
  }

  void saveProduct() async {
    debugPrint('selcat:\t$_selectedCategory');
    if(_formKey.currentState.validate() && isUrlReady){

    }
  }

  void resetFields() {
    _nameController.clear();
    _codeController.clear();
    _regUnitPriceController.clear();
    _sellingPriceController.clear();
    setState(()=> _prodImage = null);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _codeController.dispose();
    _regUnitPriceController.dispose();
    _sellingPriceController.dispose();
  }

}
