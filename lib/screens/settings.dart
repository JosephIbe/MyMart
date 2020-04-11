import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  List<String> settingsOptions = [ 'Software Customization',
    'Printers', 'Clear Records', 'Design the Receipt',
    'Payment Gateway', 'Day End', 'Setup Customer Display',
    'Setup KOT', 'Auto Launch', 'Notification Settings' ];
  String selection;

  bool _softCust = true;
  bool _printers = false;
  bool _clearRecords = false;
  bool _receiptDesign = false;
  bool _paymentGateway = false;
  bool _dayEnd = false;
  bool _customerDisplay = false;
  bool _kot = false;
  bool _autoLaunch = false;
  bool _notifSettings = false;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Column(
            children: <Widget>[
              Container(
                  width: screenWidth,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Colors.amber, width: 1.0)),
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        hint: Text(settingsOptions[0]),
                        isExpanded: true,
                        isDense: true,
                        value: selection,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.amber[700],
                        ),
                        iconSize: 40,
                        onChanged: handleSelections,
                        items: settingsOptions.map((option) {
                          return DropdownMenuItem(
                              value: option,
                              child: Container(
//                      width: double.infinity,
                                alignment:Alignment.centerLeft,
                                padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                margin: EdgeInsets.only(top: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: Text(option),
                              )
                          );
                        }).toList(),
                      ),
                    ),
                  )
              ),
//              renderScreensFromSelections()
            ],
          )
      ),
    );
  }

  void handleSelections(String value) {
    setState(() => selection = value);
    print(selection);
    switch (selection){
      case 'Software Customization':
        setState(() {
          _softCust = true;
          _printers = false;
          _clearRecords = false;
          _receiptDesign = false;
          _paymentGateway = false;
          _dayEnd = false;
          _customerDisplay = false;
          _kot = false;
          _autoLaunch = false;
          _notifSettings = false;
        });
        break;
      case 'Printers':
        setState(() {
          _printers = true;
          _softCust = false;
          _clearRecords = false;
          _receiptDesign = false;
          _paymentGateway = false;
          _dayEnd = false;
          _customerDisplay = false;
          _kot = false;
          _autoLaunch = false;
          _notifSettings = false;
        });
        break;
      case 'Clear Records':
        setState(() {
          _clearRecords = true;
          _softCust = false;
          _printers = false;
          _receiptDesign = false;
          _paymentGateway = false;
          _dayEnd = false;
          _customerDisplay = false;
          _kot = false;
          _autoLaunch = false;
          _notifSettings = false;
        });
        break;
      case 'Design the Receipt':
        setState(() {
          _receiptDesign = true;
          _clearRecords = false;
          _softCust = false;
          _printers = false;
          _paymentGateway = false;
          _dayEnd = false;
          _customerDisplay = false;
          _kot = false;
          _autoLaunch = false;
          _notifSettings = false;
        });
        break;
      case 'Payment Gateway':
        setState(() {
          _paymentGateway = true;
          _clearRecords = false;
          _softCust = false;
          _printers = false;
          _receiptDesign = false;
          _dayEnd = false;
          _customerDisplay = false;
          _kot = false;
          _autoLaunch = false;
          _notifSettings = false;
        });
        break;
      case 'Day End':
        setState(() {
          _dayEnd = true;
          _clearRecords = false;
          _softCust = false;
          _printers = false;
          _receiptDesign = false;
          _paymentGateway = false;
          _customerDisplay = false;
          _kot = false;
          _autoLaunch = false;
          _notifSettings = false;
        });
        break;
      case 'Setup Customer Display':
        setState(() {
          _customerDisplay = true;
          _clearRecords = false;
          _softCust = false;
          _printers = false;
          _receiptDesign = false;
          _paymentGateway = false;
          _dayEnd = false;
          _kot = false;
          _autoLaunch = false;
          _notifSettings = false;
        });
        break;
      case 'Setup KOT':
        setState(() {
          _kot = true;
          _clearRecords = false;
          _softCust = false;
          _printers = false;
          _receiptDesign = false;
          _paymentGateway = false;
          _dayEnd = false;
          _customerDisplay = false;
          _autoLaunch = false;
          _notifSettings = false;
        });
        break;
      case 'Auto Launch':
        setState(() {
          _autoLaunch = true;
          _clearRecords = false;
          _softCust = false;
          _printers = false;
          _receiptDesign = false;
          _paymentGateway = false;
          _dayEnd = false;
          _customerDisplay = false;
          _kot = false;
          _notifSettings = false;
        });
        break;
      case 'Notification Settings':
        setState(() {
          _notifSettings = true;
          _clearRecords = false;
          _softCust = false;
          _printers = false;
          _receiptDesign = false;
          _paymentGateway = false;
          _dayEnd = false;
          _customerDisplay = false;
          _kot = false;
          _autoLaunch = false;
        });
        break;
    }
  }

//  renderScreensFromSelections() {
//    if(_softCust){
//      return SoftwareCustomization();
//    } else if(_printers) {
//      return Printers();
//    } else if(_clearRecords) {
//      return ClearRecords();
//    } else if (_receiptDesign){
//      return ReceiptDesign();
//    } else if(_paymentGateway){
//      return PaymentGateways();
//    } else if(_dayEnd){
//      return DayEnd();
//    } else if(_customerDisplay){
//      return CustomerDisplay();
//    } else if(_kot){
//      return SetUpKOT();
//    } else if(_autoLaunch){
//      return AutoLaunch();
//    } else if(_notifSettings){
//      return NotificationSettings();
//    }
//  }

}
