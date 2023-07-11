import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProfileDetailsScreen extends StatefulWidget {
  const AddProfileDetailsScreen({super.key});

  @override
  _AddProfileDetailsScreenState createState() =>
      _AddProfileDetailsScreenState();
}

class _AddProfileDetailsScreenState extends State<AddProfileDetailsScreen> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _Controller = TextEditingController();

  // Future getImageFromCamera() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     }
  //   });
  // }

  // Future getImageFromGallery() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              // GestureDetector(
              //   onTap: () {
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: const Text('Choose Image'),
              //           content: SingleChildScrollView(
              //             child: ListBody(
              //               children: <Widget>[
              //                 GestureDetector(
              //                   child: const Text('Camera'),
              //                   onTap: () {
              //                     getImageFromCamera();
              //                     Navigator.of(context).pop();
              //                   },
              //                 ),
              // const SizedBox(height: 10),
              // GestureDetector(
              //   child: const Text('Gallery'),
              //   onTap: () {
              //     getImageFromGallery();
              //     Navigator.of(context).pop();
              //   },
              // ),

              // child: CircleAvatar(
              //   radius: 80,
              //   backgroundImage: _image != null ? FileImage(_image!) : null,
              //   child: _image == null
              //       ? const Icon(Icons.add_a_photo, size: 40)
              //       : null,
              // ),

              const SizedBox(height: 20),
              TextField(
                controller: _firstnameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              TextField(
                controller: _lastnameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'city',
                ),
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Country',
                ),
              ),
              TextField(
                controller: _bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your logic here to save the profile details
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
