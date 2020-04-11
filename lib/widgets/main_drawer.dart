import 'package:flutter/material.dart';
import 'package:g_mart/services/auth.dart';
import 'package:g_mart/services/auth.dart';
import 'package:g_mart/utils/constants.dart';

class MainDrawer extends StatelessWidget {

  final String role;
  MainDrawer({this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.0,
      child: Drawer(
        elevation: 5.0,
        child: ListView(
          children: <Widget>[
            Container(
              height: 150.0,
              decoration: BoxDecoration(
                color: Colors.deepOrange[200],
              ),
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'The Gentle\'s FoodMart',
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white70),
                  ),
                ],
              ),
            ),
            role == 'Admin' || role == 'SuperUser' ?
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, createUsersRoute);
              },
              title: Text('Create Users'),
              leading: Icon(
                Icons.add_circle_outline,
                color: Colors.amber[400],
              ),
            )
                : Container(),
            role == 'Admin' || role == 'SuperUser' ?
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, manageUsersRoute);
              },
              title: Text('Manage Users'),
              leading: Icon(
                Icons.remove_circle,
                color: Colors.amber[400],
              ),
            )
                : Container(),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, stockMgtRoute);
              },
              title: Text('Manage Stock'),
              leading: Icon(
                Icons.category,
                color: Colors.amber[400],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, salesReportRoute);
              },
              title: Text('Sales Report'),
              leading: Icon(
                Icons.add_circle_outline,
                color: Colors.amber[400],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, allProductsRoute, arguments: role);
              },
              title: Text('Products'),
              leading: Icon(
                Icons.mode_edit,
                color: Colors.amber[400],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, settingsRoute);
              },
              title: Text('Settings'),
              leading: Icon(
                Icons.settings,
                color: Colors.amber[400],
              ),
            ),
            ListTile(
              onTap: ()=> signOut(context),
              title: Text('Log Out'),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.amber[400],
              ),
            ),
            ListTile(
              title: Text('Contact'),
              leading: Icon(Icons.contact_phone, color: Colors.amber[400],),
            )
          ],
        ),
      ),
    );
  }

  void signOut(BuildContext context) async {
    AuthService _authService = AuthService();
    await _authService.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, loginRoute, (Route<dynamic> route) => false);
  }

}
