// part of 'img_upload_bloc.dart';

// abstract class ImageUploadState extends Equatable {
//   const ImageUploadState();
  
//   @override
//   List<Object> get props => [];
// }

// class ImgUploadInitial extends ImageUploadState {}
// class ImgUploadFail extends ImageUploadState {
//   final String ?imagePath;
//   const ImgUploadFail ({
//      this.imagePath=null,

//   });

  

// @override
// List<Object> get props => [];
//   ImgUploadFail copyWith({
//     String? imagePath
    
//   }) {
//     return ImgUploadFail(
//       imagePath:imagePath
    
//     );
//   }
// }
// class ImgUploadsuccess extends ImageUploadState {

//    final String imagePath;
//   const ImgUploadsuccess ({
//      required this.imagePath,

//   });

  

// @override
// List<Object> get props => [imagePath];
//   ImgUploadFail copyWith({
//     String? imagePath
    
//   }) {
//     return ImgUploadFail(
//       imagePath:imagePath??this.imagePath
    
//     );
//   }


// }
// lib/models/image_upload_state.dart

import 'package:equatable/equatable.dart';

class ImageUploadState extends Equatable {
  final String ?imagePath;

    ImageUploadState({
     this.imagePath
  });


  @override
  List<Object> get props => [];
  ImageUploadState copyWith({
    String? imagePath    
  }) {
    return ImageUploadState(
          imagePath: imagePath ?? this.imagePath
    );
  }
}


