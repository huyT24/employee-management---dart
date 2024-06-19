import 'dart:io';
import '../Model/employee.dart';
import '../serviceImpl/employeeServiceImpl.dart';

int? yourChoice;
EmployeeServiceImpl employeeServiceImpl = EmployeeServiceImpl();

void main() {
  while (true) {
    print("==========Employee Management==========");
    print("0. Exist program");
    print("1. Add employee");
    print("2. Update employee by id");
    print("3. Delete employee by id");
    print("4. View employee list");
    print("5. Find by id");

    try {
      print("Enter the operation's number: ");
      yourChoice = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Enter number from 0 to 4, please!");
      continue;
    }

    switch (yourChoice) {
      case 0:
        print("The program finish!");
        exit(0);
      case 1:
        print("----------Add an employee information----------");
        print("Enter employee name: ");
        String employeeName = stdin.readLineSync()!;
        print("Enter employee department: ");
        String employeeDepartment = stdin.readLineSync()!;

        while (employeeName.isEmpty || employeeDepartment.isEmpty) {
          if (employeeName.isEmpty) {
            print("Please! Name is not empty.");
            print("Enter employee name: ");
            employeeName = stdin.readLineSync()!;
            continue;
          }

          if (employeeDepartment.isEmpty) {
            print("Please! Department is not empty.");
            print("Enter employee department: ");
            employeeDepartment = stdin.readLineSync()!;
          }
        }

        employeeServiceImpl.addEmployee(employeeName, employeeDepartment);
        break;
      case 2:
        print("----------Updating an employee information----------");
        print("Enter employee ID: ");
        var id;
        bool isContinue = true;

        while (isContinue) {
          try {
            id = int.parse(stdin.readLineSync()!);
            isContinue = false;
          } catch (e) {
            print("Enter number, please!");
            continue;
          }
        }

        if (employeeServiceImpl.findById(id) == null) {
          print("ID doesn't exist");
          break;
        }

        print("Do you want to update employee's name or department?");
        String fieldName = stdin.readLineSync()!.toLowerCase();

        while (fieldName.isEmpty) {
          print("Please! input is not empty.");
          print("Enter input: ");
          fieldName = stdin.readLineSync()!.toLowerCase();
        }

        if (fieldName == "name") {
          print("Enter employee name: ");
          String employeeName = stdin.readLineSync()!;
          while (employeeName.isEmpty) {
            print("Please! Name is not empty.");
            print("Enter employee name: ");
            employeeName = stdin.readLineSync()!;
          }

          employeeServiceImpl.updateEmployee(id, name: employeeName);
        }

        if (fieldName == "department") {
          print("Enter employee department: ");
          String employeeDepartment = stdin.readLineSync()!;

          while (employeeDepartment.isEmpty) {
            print("Please! Department is not empty.");
            print("Enter employee department: ");
            employeeDepartment = stdin.readLineSync()!;
          }

          employeeServiceImpl.updateEmployee(id,
              department: employeeDepartment);
        }

        break;
      case 3:
        print("----------Deleting an employee information----------");
        print("Enter employee ID: ");
        var id;
        bool isContinue = true;

        while (isContinue) {
          try {
            id = int.parse(stdin.readLineSync()!);
            isContinue = false;
          } catch (e) {
            print("Enter number, please!");
          }
        }

        employeeServiceImpl.deleteEmployee(id);
        break;
      case 4:
        print("----------View all employees information----------");
        List<Employee> employees = employeeServiceImpl.viewEmployeeList();
        for (Employee employee in employees) {
          print(employee.toString());
        }
        break;
      case 5:
        print("----------View an employee information----------");
        var id;
        bool isContinue = true;

        while (isContinue) {
          print("Enter employee ID: ");
          try {
            id = int.parse(stdin.readLineSync()!);
            isContinue = false;
          } catch (e) {
            print("Enter number, please!");
          }
        }
        Employee? employee = employeeServiceImpl.findById(id);

        if (employee == null) {
          print("ID doesn't exist!");
          break;
        }

        print(employee.toString());

        break;
      default:
        print("Enter number from 0 to 4, please!");
    }
  }
}
