import 'package:flutter/material.dart';
import 'package:g_mart/widgets/products/create_product.dart';

class AddOptionView extends StatefulWidget {
  @override
  _AddOptionViewState createState() => _AddOptionViewState();
}

class _AddOptionViewState extends State<AddOptionView> {

  bool isShowProductsForm = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: isShowProductsForm == false ? Container(
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
              )
          ),
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3.5, color: Colors.brown)
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'NO ITEMS',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 10,
                child: FloatingActionButton(
                  onPressed: changeViews,
                  child: Icon(Icons.add, color: Colors.white,),
                  backgroundColor: Colors.brown,
                ),
              )
            ],
          ),
        ) : CreateProduct(isShowProductsForm: isShowProductsForm, changeViews: changeViews,)
    );
  }

  void changeViews() {
    setState(() {
      isShowProductsForm = !isShowProductsForm;
    });
  }
}
