import 'package:equatable/equatable.dart';

import '../repository/job_feature.dart';

class DeleteUseCase {
  final BaseJobsRepository jobRepository;

  DeleteUseCase(this.jobRepository);
}
