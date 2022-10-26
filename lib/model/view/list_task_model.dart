import '../model.dart';

class ListTaskModel{
  List<TaskModel>? tasks;
  String? location;
  bool? isLightMode;

  ListTaskModel({this.tasks,this.location,this.isLightMode});
}