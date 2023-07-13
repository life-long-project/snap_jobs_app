// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:hive/hive.dart';
import 'package:snap_jobs/profile_feature/data/model/usermodel.dart';
import 'package:snap_jobs/profile_feature/data/model/profilecasheddata.dart';

class ProfileHiveModelAdapter extends TypeAdapter<Profilehivemodel> {
  @override
  final int typeId = 1;

  @override
  Profilehivemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profilehivemodel(
      profileData: fields[0] as UserModel,
    );
  }

  @override
  void write(BinaryWriter writer, Profilehivemodel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.profileData);
  }
}
