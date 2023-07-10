import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
abstract class ImageUploadRemoteDataSource {
  Future<Either<Failure, String>> uploadImage(String imagePath, String token);
}

class HttpImageUploadRemoteDataSource implements ImageUploadRemoteDataSource {
  @override
  Future<Either<Failure, String>> uploadImage(String imagePath, String token) async {
    final url = 'https://back-ph2h.onrender.com/upload/profile/?auth_token=$token';
    final headers = {'Authorization': 'Bearer $token'};
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    request.headers.addAll(headers);

    try {
      final response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final imageUrl = responseData['imageUrl']; // Assuming the JSON field name is 'imageUrl'
        if (imageUrl != null) {
          return Right(imageUrl);
        } else {
          return Left(ServerFailure(
            'Image URL not found in API response.'
            ));
        }
      } else {
        return Left(ServerFailure('Image upload failed.'));
      }
    } catch (e) {
      return Left(ServerFailure('An error occurred during image upload.'));
    }
  }
}
