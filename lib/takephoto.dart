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
      appBar: AppBar(
        title: Center(child: Text("Take a Photo")),
        backgroundColor: Color.fromARGB(255, 75, 208, 241),
      ),
      backgroundColor: Color.fromARGB(255, 75, 208, 241),
      body: Center(
        child: _image == null ? Text("No image Selected"): Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: getImage ,
        child: Image.asset("assets/images/dslr-camera.png"),
      ),
    );
  }
}
