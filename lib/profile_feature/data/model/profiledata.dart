
import 'package:hive/hive.dart';
import 'package:snap_jobs/profile_feature/data/model/profile_get.dart';

@HiveType(typeId: 1)
class Profilehivemodel extends HiveObject   {
  @HiveField(0)
  final ProfileModel profileData;

   Profilehivemodel({
    required this.profileData,
  });
}