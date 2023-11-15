import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class EmployeeModel {
  int? index;
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String gender;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String number;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final String image;

  EmployeeModel({
    this.index,
    required this.name,
    required this.gender,
    required this.email,
    required this.number,
    required this.category,
    required this.image,
  });
}
