import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/upload%20_img_bloc/bloc/img_upload_event.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/upload%20_img_bloc/bloc/img_upload_state.dart';

import '../../../../../domain/usecase/imgupload.dart';

//part 'img_upload_event.dart';
import 'package:path/path.dart' as p;








class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  final UploadImage uploadImage;

  ImageUploadBloc(this.uploadImage) : super(const ImageUploadState());

  @override
  Stream<ImageUploadState> mapEventToState(ImageUploadEvent event) async* {
    if (event is SelectImageEvent) {
      final pickedImage = await ImagePicker().pickImage(source: event.source);
      if (pickedImage != null) {
        final imageFile = File(pickedImage.path);
        final appDir = await getTemporaryDirectory();
        final imageName = p.basename(imageFile.path);
        final savedImage = await imageFile.copy('${appDir.path}/$imageName');

        final result = await uploadImage(savedImage.path, 'YOUR_AUTH_TOKEN');
        yield result.fold(
          (failure) => state.copyWith(imagePath: null),
          (imageUrl) => state.copyWith(imagePath: savedImage.path),
        );
      }
    }
  }
}

