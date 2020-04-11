import 'package:flutter/material.dart';

class ManageUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: ()=> Navigator.of(context).pop(),
          color: Colors.white,
        ),
        title: Text('Manage Users', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
