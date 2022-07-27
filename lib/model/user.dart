import 'package:tokoperabot/model/product.dart';

class UserAccount {
  String _userName = '';
  String _userEmail = '';
  String _userPassword = '';
  Map<String, String> _emailUserName = {};
  Map<String, String> _emailUserPassword = {};
  Map<String, List> _userProductHistory = {};

  String get userName => this._userName;
  set userName(String value) => this._userName = value;

  String get userEmail => this._userEmail;
  set userEmail(value) => this._userEmail = value;

  String get userPassword => this._userPassword;
  set userPassword(value) => this._userPassword = value;

  Map<String, String> get emailUserName => this._emailUserName;
  set emailUserName(value) => this._emailUserName = value;

  Map<String, String> get emailUserPassword => this._emailUserPassword;
  set emailUserPassword( value) => this._emailUserPassword = value;

  Map<String, List> get userProductHistory => this._userProductHistory;
  set userProductHistory( value) => this._userProductHistory = value;
}
