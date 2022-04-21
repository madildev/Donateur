import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserData extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  dynamic _user_data; //This will store the data returned from the server

  dynamic get getUserData =>
      _user_data; //This is the getter funtion to get the value from the data

//This is the setter function to set the value of the function
  void setUserData(value) {
    _user_data = value;
    print('The data is successfully saved in the store');
    print(_user_data);
    notifyListeners();
  }

  String get getUserName {
    print("This is the username return by the Store");
    return _user_data[0]["user_name"];
  }
}
