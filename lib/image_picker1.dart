import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

//Image picker has underlying code to be added for IOS only -> info.plist
class ImagePicker1 extends StatefulWidget {
  final String title;
  const ImagePicker1({required this.title, super.key});

  @override
  State<ImagePicker1> createState() => _ImagePicker1State();
}

final _logger = Logger();

class _ImagePicker1State extends State<ImagePicker1> {
  ///Hold our Image file
  File? _selectedImage;

  ///Pick from camera
  Future pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedGalleryImage =
        await picker.pickImage(source: ImageSource.gallery);

    _logger.i('returned Image from gallery:::$pickedGalleryImage');

    setState(() {
      if (pickedGalleryImage != null) {
        _selectedImage = File(pickedGalleryImage.path);
        _logger.i('selected Image path from gallery:::$_selectedImage');
        _logger.i('Image path from gallery:::${pickedGalleryImage.path}');
      }
      return;
    });
  }

  Future pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedCameraImage =
        await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedCameraImage == null) return;
      _selectedImage = File(pickedCameraImage.path);
      _logger.i('selected Image path from camera:::$_selectedImage');
      _logger.i('Image path from camera:::${pickedCameraImage.path}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  pickImageFromGallery();
                },
                child: const Text('Pick from Gallery'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  pickImageFromCamera();
                },
                child: const Text('Pick from Camera'),
              ),
              const SizedBox(height: 20),
              _selectedImage != null
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Image.file(_selectedImage!))
                  : const Text('Please select an Image')
            ],
          ),
        ),
      ),
    );
  }
}
