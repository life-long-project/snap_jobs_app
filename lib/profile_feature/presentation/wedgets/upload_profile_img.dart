import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/upload%20_img_bloc/bloc/img_upload_bloc.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/upload%20_img_bloc/bloc/img_upload_event.dart';

import '../controlers/bloc/upload _img_bloc/bloc/img_upload_state.dart';

class ProfileImg extends StatelessWidget {
  
  
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
                      ? Icon(
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
                    style: ElevatedButton.styleFrom(shape: CircleBorder()),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Choose an option'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.photo_library),
                                    title: Text('Gallery'),
                                    onTap: () {
                                      BlocProvider.of<ImageUploadBloc>(
                                              context)
                                          .add(SelectImageEvent(
                                              ImageSource.gallery));
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.camera),
                                    title: Text('Camera'),
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
                    child: Icon(
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
