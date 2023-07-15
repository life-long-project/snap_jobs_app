

import 'package:json_annotation/json_annotation.dart';
import 'package:snap_jobs/rate/domain/entities/rate.dart';

part 'rate_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson :true ,
 )
class RateModel extends RateEntity {
  RateModel({required super.rate});


  @override
  @JsonKey(
    required: true,
    name:"rating"
  )
  double get rate => super.rate;



  @override
  @JsonKey(
    required: false,
    name :"feedback"
  )
  String get message => super.message;







  factory RateModel.fromJson(Map<String, dynamic> json) =>
      _$RateModelFromJson(json);

  Map<String, dynamic> toJson() => _$RateModelToJson(this);


}