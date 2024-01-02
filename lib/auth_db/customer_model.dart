import 'package:hive/hive.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 0)
class CustomerModel {
  CustomerModel({required this.name, required this.number, required this.surname});
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String surname;

  @HiveField(2)
  late String number;
}
