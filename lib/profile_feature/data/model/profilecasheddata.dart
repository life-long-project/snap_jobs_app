
import 'package:hive/hive.dart';
import 'package:snap_jobs/profile_feature/data/model/profilemodel.dart';

@HiveType(typeId: 1)
class Profilehivemodel extends HiveObject   {
  @HiveField(0)
  final ProfileModel profileData;

   Profilehivemodel({
    required this.profileData,
  });
}