
import 'package:image_picker/image_picker.dart';

abstract class ImageUploadEvent {}

class SelectImageEvent extends ImageUploadEvent {
  final ImageSource source;

  SelectImageEvent(this.source);
}