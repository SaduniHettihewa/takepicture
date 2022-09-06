import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Takephoto extends StatefulWidget {
  const Takephoto({Key? key}) : super(key: key);

  @override
  State<Takephoto> createState() => _TakephotoState();
}

class _TakephotoState extends State<Takephoto> {
  @override
  File ? _image;
  final imagePicker = ImagePicker();

  Future getImage() async{
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null ? Text("No image Selected"): Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: getImage ,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}