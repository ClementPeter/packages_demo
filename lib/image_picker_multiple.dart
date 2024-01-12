import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

//Image picker has underlying code to be added for IOS only -> info.plist
class ImagePickerMultiple extends StatefulWidget {
  final String title;
  const ImagePickerMultiple({required this.title, super.key});

  @override
  State<ImagePickerMultiple> createState() => _ImagePickerMultipleState();
}

class _ImagePickerMultipleState extends State<ImagePickerMultiple> {
  final _logger = Logger();

  ///Holds Multiple Images
  final List<XFile> _selectedMultipleImage = [];

  ///Awon Agba Picker
  Future pickMultipleImages() async {
    final ImagePicker picker = ImagePicker();

    final List<XFile> pickedMultipleImages = await picker.pickMultiImage();

    setState(() {
      if (pickedMultipleImages.isEmpty) return;

      if (pickedMultipleImages.isNotEmpty) {
        _selectedMultipleImage.addAll(pickedMultipleImages);
        _logger.i(
            'selected Image path from gallery:::${pickedMultipleImages[0].name}');
        _logger.i(
            'selected Image path from gallery:::${pickedMultipleImages[1].name}');
        _logger.i(
            'selected Image path from gallery:::${pickedMultipleImages[2].name}');
      }
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  pickMultipleImages();
                },
                child: const Text('Pick Multiple Images from Gallery'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: _selectedMultipleImage.length,
                  itemBuilder: (context, index) {
                    final File fileContent =
                        File(_selectedMultipleImage[index].path);
                    return SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.file(fileContent),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
