import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class EmployeeModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String adress;

  @HiveField(3)
  final String gender;

  @HiveField(4)
  final String email;

  @HiveField(5)
  final String phone;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.adress,
    required this.gender,
    required this.email,
    required this.phone,
  });
}
