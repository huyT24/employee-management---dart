import '../Model/employee.dart';

abstract class IEmployee {
  void addEmployee(String name, String department);
  void updateEmployee(int id, {String name, String department});
  void deleteEmployee(int id);
  List<Employee> viewEmployeeList();
  Employee? findById(int id);
}