class Employee{
  int? _id;
  String? _name;
  String? _department;

  Employee({int? id, String? name, String? department}){
    this._id = id;
    this._name = name;
    this._department = department;
  }

  int get getId => this._id!;

  set setId(int id) => this._id = id;

  String get getName => this._name!;

  set setName(String name) => this._name = name;

  String get getDepartment => this._department!;

  set setDepartment(String department) => this._department = department;

  @override
  bool operator ==(Object other) {
    return super == other;
  }

  @override
  int get hashCode => super.hashCode;

  @override
  String toString() {
    String result = "{id:${this._id}," +
    "name:${this._name}, department: ${this._department}}";
    return result;
  }
}