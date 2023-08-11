import 'package:isar/isar.dart';
import 'detail.dart';
part 'type.g.dart';

@embedded
class TypeModel {
   int? slot;
   @ignore
   Detail? type;

  TypeModel({
     this.slot,
     this.type,
  });



  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      TypeModel(slot: json["slot"], type: Detail.fromJson(json["type"]));
}
