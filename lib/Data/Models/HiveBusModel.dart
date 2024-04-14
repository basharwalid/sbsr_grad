import 'package:hive/hive.dart';
part 'HiveBusModel.g.dart';
@HiveType(typeId: 0)
class HiveBusModel{
  @HiveField(0)
  String busName;
  @HiveField(1)
  String from;
  @HiveField(2)
  String to;
  @HiveField(3)
  String nextStation;
  @HiveField(4)
  String uid;
  HiveBusModel({required this.busName , required this.from, required this.to, required this.nextStation,required this.uid});
}
