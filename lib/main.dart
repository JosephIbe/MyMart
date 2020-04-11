import 'package:flutter/material.dart';
import 'package:g_mart/models/products.dart';
import 'package:g_mart/models/user.dart';
import 'package:g_mart/screens/home.dart';
import 'package:g_mart/services/auth.dart';
import 'package:g_mart/services/database.dart';
import 'package:g_mart/utils/router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyMart());

class MyMart extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AuthService().user),
        StreamProvider<List<Products>>.value(value: DatabaseService().products)
      ],
      child: OKToast(
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Mart',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: Home(),
          onGenerateRoute: Router.generateRoute,
        ),
      )
    );
  }
}