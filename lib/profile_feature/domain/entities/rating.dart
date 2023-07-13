import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  const Rating({
    required this.rating,
     this.feedback
  });
  final int rating;
  final String ?feedback;

  @override
 
  List<Object?> get props => [rating,feedback];
}
