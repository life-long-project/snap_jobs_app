import '../../domain/entities/rating.dart';

class RatingModel extends Rating {
  RatingModel({required super.rating, required super.feedback});

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
    
    feedback: json['feedback'],
   rating:json['rating'] 




  );
}
