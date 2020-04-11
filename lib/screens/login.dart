import 'package:flutter/material.dart';
import 'package:g_mart/services/auth.dart';
import 'package:g_mart/utils/constants.dart';
import 'package:g_mart/utils/styles.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email, password, errorMsg;
  bool _obscurePwd = true;
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
      ),
      body: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.75, 1],
              colors: [
                Color(0xFFffffff),
                Color(0xFFffe9bf),
                Color(0xFFffd280),
              ],
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(26.0),
          child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/logo.png', height: 100.0,),
                      Text('The Gentle\'s FoodMart', style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.amber),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        maxLines: 1,
                        decoration: formInputDecors
                            .copyWith(hintText: 'Your Email', labelText: 'Email Address'),
                        onChanged: (value) => setState(()=> email = value),
                        validator: (String value){
                          return !value.contains('@') ? 'Invalid Email' : null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10.0,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent[100],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                  obscureText: _obscurePwd,
                                  maxLines: 1,
                                  decoration: formInputDecors
                                      .copyWith(hintText: 'Your Password', labelText: 'Your Password'),
                                  onChanged: (value) => setState(()=> password = value),
                                  validator: (String value){
                                    return value.length < 6 ? 'Password too short' : null;
                                  }
                              ),
                            ),
                            IconButton(
                              icon: Icon(_obscurePwd
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: _toggleVisibility,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        width: w,
                        child: RaisedButton(
                          color: Colors.brown[400],
                          textColor: Colors.white,
                          onPressed: validateInputs,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                          child: Text('Continue', style: TextStyle(fontSize: 18.0),),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }

  void _toggleVisibility() {
    setState(() {
      _obscurePwd = !_obscurePwd;
    });
  }

  validateInputs() async {
    if(_formKey.currentState.validate()){
      dynamic status = await _authService.loginUser(email, password);
      if(status == null){
        setState(() {
          errorMsg = status.toString();
        });
        SnackBar errorSnack = SnackBar(
          content: Text(errorMsg.substring(0, 15)),
          backgroundColor: Colors.black,
          duration: Duration(seconds: 2),
        );
        Scaffold.of(context).showSnackBar(errorSnack);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, homeRoute, (Route<dynamic> route) => false);
      }
    }
  }

}
