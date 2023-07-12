import 'package:hive/hive.dart';
import 'package:snap_jobs/profile_feature/data/model/usermodel.dart';

@HiveType(typeId: 1)
class Profilehivemodel extends HiveObject {
  @HiveField(0)
  final UserModel profileData;

  Profilehivemodel({
    required this.profileData,
  });
}
