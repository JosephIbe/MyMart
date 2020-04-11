import 'package:flutter/material.dart';
import 'package:g_mart/utils/styles.dart';

class CreateUserRole extends StatefulWidget {
  @override
  _CreateUserRoleState createState() => _CreateUserRoleState();
}

class _CreateUserRoleState extends State<CreateUserRole> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController unController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  String errorMsg;

  bool _obscurePwd = true;
  bool _isSalesAgent = false;
  bool _isAdmin = false;
  bool _isAccountManager = false;
  bool _isCreatingUser;

  int selectedRadio;

  @override
  void initState() {
    super.initState();
    resetForm();
    _isCreatingUser = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        iconTheme: IconThemeData(
//          color: Colors.white
//        ),
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: ()=> Navigator.of(context).pop(),
          color: Colors.white,
        ),
        title: Text('Create User', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.75, 1],
              colors: [
                Color(0xFFffffff),
                Color(0xFFffd280),
                Color(0xFFffe9bf),
              ],
            )),
        child: Padding(
          padding: EdgeInsets.fromLTRB(26.0, 5.0, 26.0, 26.0),
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 100.0,
                    ),
                    TextFormField(
                      maxLines: 1,
                      controller: unController,
                      decoration: formInputDecors.copyWith(
                          hintText: 'User Name (Optional)', labelText: 'UserName'),
                      validator: (String value) {
                        return value.length < 4 ? 'Username Too Short' : null;
                      },
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: emailController,
                      maxLines: 1,
                      decoration: formInputDecors.copyWith(
                          hintText: 'User Email', labelText: 'User Email'),
                      validator: (String value) {
                        return !value.contains('@') ? 'Invalid Email' : null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent[100],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                                controller: pwdController,
                                obscureText: _obscurePwd,
                                maxLines: 1,
                                decoration: formInputDecors.copyWith(
                                    hintText: 'User Password',
                                    labelText: 'User Password'),
                                validator: (String value) {
                                  return value.length < 6
                                      ? 'Password too short'
                                      : null;
                                }),
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
                    SizedBox(height: 20.0,),
                    Text(
                      'Specify User Roles', style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Radio(
                              value: 0,
                              groupValue: selectedRadio,
                              activeColor: Colors.lightGreen,
                              onChanged: (value)=> setSelection(value),
                            ),
                            Text('Admin'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                              value: 1,
                              groupValue: selectedRadio,
                              activeColor: Colors.lightGreen,
                              onChanged: (value)=> setSelection(value),
                            ),
                            Text('Sales'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                              value: 2,
                              groupValue: selectedRadio,
                              activeColor: Colors.lightGreen,
                              onChanged: (value)=> setSelection(value),
                            ),
                            Text('Accounts'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: ()=> createUserRoles(),
                        child: Text(!_isCreatingUser ? 'CREATE USER' : 'PLEASE WAIT...'),
                        color: Colors.orange[400],
                        textColor: Colors.white,
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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

  setSelection(value) {
    setState(() {
      selectedRadio = value;
    });

    switch(value){
      case 0:
        setState(() {
          _isAdmin = true;
          _isSalesAgent = false;
          _isAccountManager = false;
        });
        break;
      case 1:
        setState(() {
          _isSalesAgent = true;
          _isAdmin = false;
          _isAccountManager = false;
        });
        break;
      case 2:
        setState(() {
          _isAccountManager = true;
          _isAdmin = false;
          _isSalesAgent = false;
        });
        break;
    }

  }

  void createUserRoles() async {
//    if(_formKey.currentState.validate()){
//      setState(()=> _isCreatingUser = true);
//      switch(selectedRadio){
//        case 0:
//          break;
//        case 1:
//          break;
//        case 2:
//          break;
//      }
//    }
//    else {
//      setState(()=> _isCreatingUser = false);
//    }
  }

  void resetForm() {
    unController.clear();
    emailController.clear();
    pwdController.clear();
    setState(()=> selectedRadio = -1);
  }

}
