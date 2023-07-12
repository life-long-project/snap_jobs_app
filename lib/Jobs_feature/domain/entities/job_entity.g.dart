// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobEntityAdapter extends TypeAdapter<JobEntity> {
  @override
  final int typeId = 1;

  @override
  JobEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobEntity(
      dateTime: fields[3] as DateTime,
      userId: fields[2] as String?,
      isAlreadyApplied: fields[8] as bool?,
      offers: (fields[5] as List?)?.cast<OfferEntity>(),
      userName: fields[4] as String?,
      jobTitle: fields[6] as String,
      jobDescription: fields[13] as String,
      jobType: fields[12] as JobType,
      salary: fields[14] as int,
      skills: (fields[15] as List?)?.cast<String>(),
      isActive: fields[11] as bool,
      isFinished: fields[9] as bool,
      workerId: fields[7] as String?,
      duration: fields[16] as int?,
      image: (fields[17] as List).cast<String?>(),
      jobId: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JobEntity obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.jobId)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.dateTime)
      ..writeByte(4)
      ..write(obj.userName)
      ..writeByte(5)
      ..write(obj.offers)
      ..writeByte(6)
      ..write(obj.jobTitle)
      ..writeByte(7)
      ..write(obj.workerId)
      ..writeByte(8)
      ..write(obj.isAlreadyApplied)
      ..writeByte(9)
      ..write(obj.isFinished)
      ..writeByte(10)
      ..write(obj.distance)
      ..writeByte(11)
      ..write(obj.isActive)
      ..writeByte(12)
      ..write(obj.jobType)
      ..writeByte(13)
      ..write(obj.jobDescription)
      ..writeByte(14)
      ..write(obj.salary)
      ..writeByte(15)
      ..write(obj.skills)
      ..writeByte(16)
      ..write(obj.duration)
      ..writeByte(17)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class JobTypeAdapter extends TypeAdapter<JobType> {
  @override
  final int typeId = 2;

  @override
  JobType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return JobType.fullTime;
      case 1:
        return JobType.partTime;
      case 2:
        return JobType.service;
      default:
        return JobType.fullTime;
    }
  }

  @override
  void write(BinaryWriter writer, JobType obj) {
    switch (obj) {
      case JobType.fullTime:
        writer.writeByte(0);
        break;
      case JobType.partTime:
        writer.writeByte(1);
        break;
      case JobType.service:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
