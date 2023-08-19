import 'package:flutter/material.dart';

class EmployeeData extends ChangeNotifier {
  EmployeeData({this.empname, this.empage});
  String? empname;
  String? empage;
  void update({required name, required age}) {
    empname = name;
    empage = age;
    notifyListeners();
  }

  void dispose() {
    empname = "";
    empage = "";
    notifyListeners();
  }

  String? get getname => empname;
  String? get getage => empage;
}
