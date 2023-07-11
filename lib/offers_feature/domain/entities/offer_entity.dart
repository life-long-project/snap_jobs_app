import 'package:equatable/equatable.dart';

class OfferEntity extends Equatable {
  final String? offerId;
  final String jobId;
  final String? applicantId;
  final int salary;
  final String? applicantName;
  final bool isAccepted;
  final String? message;

  const OfferEntity.empty()
      : offerId = null,
        applicantId = null,
        isAccepted = false,
        jobId = "",
        salary = 0,
        applicantName = "",
        message = null;

  const OfferEntity({
    required this.isAccepted,
    required this.offerId,
     this. applicantName,
    this.applicantId,
    required this.jobId,
    required this.salary,
    this.message,
  });

  @override
  List<Object?> get props => [offerId, jobId, salary, message, applicantId];

  OfferEntity copyWith({
    String? offerId,
    String? jobId,
    int? salary,
    String? applicantName,
    String? message,
    String? applicantId,
    bool? isAccepted,
  }) {
    return OfferEntity(
      offerId: offerId ?? this.offerId,
      isAccepted: isAccepted ?? this.isAccepted,
      applicantId: applicantId ?? this.applicantId,
      jobId: jobId ?? this.jobId,
      applicantName: applicantName ?? this.applicantName,
      salary: salary ?? this.salary,
      message: message ?? this.message,
    );
  }
}
