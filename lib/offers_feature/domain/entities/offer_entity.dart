import 'package:equatable/equatable.dart';

class OfferEntity extends Equatable {
  final String? offerId;
  final String jobId;
  final String? applicantId;
  final int salary;
  final String? message;

  const OfferEntity.empty()
      : offerId = null,
applicantId = null,
        jobId = "",
        salary = 0,
        message = null;

  const OfferEntity({
    required this.offerId,
    this.applicantId,
    required this.jobId,
    required this.salary,
    this.message,
  });

  @override
  List<Object?> get props => [offerId, jobId, salary, message , applicantId];

  OfferEntity copyWith(
      {String? offerId, String? jobId, int? salary, String? message , String? applicantId}) {
    return OfferEntity(
      offerId: offerId ?? this.offerId,
      applicantId: applicantId?? this.applicantId,
      jobId: jobId ?? this.jobId,
      salary: salary ?? this.salary,
      message: message ?? this.message,
    );
  }
}
