import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/upload%20_img_bloc/bloc/img_upload_bloc.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/upload%20_img_bloc/bloc/img_upload_event.dart';

import '../controlers/bloc/upload _img_bloc/bloc/img_upload_state.dart';

class ProfileImg extends StatelessWidget {
  const ProfileImg({super.key});

  
  
  //final ImageUploadBloc imageUploadBloc = sl<ImageUploadBloc>();
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageUploadBloc, ImageUploadState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey,
                  backgroundImage: state.imagePath != null
                      ? FileImage(File(state.imagePath!))
                      : null,
                  child: state.imagePath == null
                      ? const Icon(
                          Icons.person_2_sharp,
                          size: 50,
                          color: Colors.white,
                        )
                      : null,
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Choose an option'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  ListTile(
                                    leading: const Icon(Icons.photo_library),
                                    title: const Text('Gallery'),
                                    onTap: () {
                                      BlocProvider.of<ImageUploadBloc>(
                                              context)
                                          .add(SelectImageEvent(
                                              ImageSource.gallery));
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.camera),
                                    title: const Text('Camera'),
                                    onTap: () {
                                      BlocProvider.of<ImageUploadBloc>(
                                              context)
                                          .add(SelectImageEvent(
                                              ImageSource.camera));
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
