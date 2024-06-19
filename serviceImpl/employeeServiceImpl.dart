import '../Model/employee.dart';
import '../service/IEmployee.dart';
import 'dart:io';
import 'dart:convert';

class EmployeeServiceImpl implements IEmployee {
  static final File employeeListFile = File("To-Do project/employee_list.json");
  @override
  void addEmployee(String name, String department) {
    if (employeeListFile.existsSync()) {
      String contents = employeeListFile.readAsStringSync();
      var jsonResults = jsonDecode(contents);
      List<Map<String, dynamic>> employees = List.empty(growable: true);
      for (var result in jsonResults) {
        Map<String, dynamic> employee = {
          "id": result["id"],
          "name": result["name"],
          "department": result["department"]
        };

        employees.add(employee);
      }

      Map<String, dynamic> newEmployee = {
        "id": employees.length + 1,
        "name": name,
        "department": department
      };

      employees.add(newEmployee);
      employeeListFile.writeAsStringSync('');

      employeeListFile.writeAsStringSync(jsonEncode(employees),
          mode: FileMode.append);

      print("----------Adding new employee is successful----------");
    } else {
      throw Exception("Employee list file doesn't exist!");
    }
  }

  @override
  void deleteEmployee(int id) {
    if (findById(id) == null) {
      print("ID doesn't exist");
      return;
    }

    if (employeeListFile.existsSync()) {
      String contents = employeeListFile.readAsStringSync();
      var jsonResults = jsonDecode(contents);
      List<Map<String, dynamic>> employees = List.empty(growable: true);
      for (var result in jsonResults) {
        Map<String, dynamic> employee = {
          "id": result["id"],
          "name": result["name"],
          "department": result["department"]
        };

        employees.add(employee);
      }

      for (var employee in employees) {
        if (employee["id"] == id) {
          employees.remove(employee);
          break;
        }
      }
      employeeListFile.writeAsStringSync('');

      employeeListFile.writeAsStringSync(jsonEncode(employees),
          mode: FileMode.append);

      print("----------Deleting employee is successful----------");
    } else {
      throw Exception("Employee list file doesn't exist!");
    }
  }

  @override
  Employee? findById(int id) {
    if (employeeListFile.existsSync()) {
      String contents = employeeListFile.readAsStringSync();
      var jsonResults = jsonDecode(contents);
      List<Map<String, dynamic>> employees = List.empty(growable: true);
      for (var result in jsonResults) {
        Map<String, dynamic> employee = {
          "id": result["id"],
          "name": result["name"],
          "department": result["department"]
        };

        employees.add(employee);
      }

      for (var employee in employees) {
        if (employee["id"] == id) {
          return Employee(
              id: employee["id"],
              name: employee["name"],
              department: employee["department"]);
        }
      }

      print("----------Finding employee is done----------");
    } else {
      throw Exception("Employee list file doesn't exist!");
    }

    return null;
  }

  @override
  void updateEmployee(int id, {String name = "1", String department = ""}) {
    if (employeeListFile.existsSync()) {
      String contents = employeeListFile.readAsStringSync();
      var jsonResults = jsonDecode(contents);
      List<Map<String, dynamic>> employees = List.empty(growable: true);
      for (var result in jsonResults) {
        Map<String, dynamic> employee = {
          "id": result["id"],
          "name": result["name"],
          "department": result["department"]
        };

        employees.add(employee);
      }

      for (var employee in employees) {
        if (employee["id"] == id) {
            if (name.isNotEmpty) {
              print(name);
              employee["name"] = name;
              break;
            }

            if (department.isNotEmpty) {
              employee["department"] = name;
              break;
            }
        }
        print(employee["id"] == id);
      }

      employeeListFile.writeAsStringSync('');
      employeeListFile.writeAsStringSync(jsonEncode(employees),
          mode: FileMode.append);

      print("----------Finding employee is done----------");
    } else {
      throw Exception("Employee list file doesn't exist!");
    }
  }

  @override
  List<Employee> viewEmployeeList() {
    if (employeeListFile.existsSync()) {
      String contents = employeeListFile.readAsStringSync();
      List<Employee> emList = jsonDecode(contents);
      return emList;
    } else {
      throw Exception("Employee list file doesn't exist!");
    }
  }
}
