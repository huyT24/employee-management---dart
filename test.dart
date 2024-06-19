import 'dart:convert';
import 'dart:io';

import 'Model/employee.dart';
void main() {
  File file = File("To-Do project/employee_list.json");

  String contents = file.readAsStringSync();
  print(contents);

  var em = jsonDecode(contents);

  for(var employee in em) {
    print(employee.runtimeType);
  }
}