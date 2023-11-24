import 'package:apidata/ImageSLiders/image_slider_two.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'dart:io';

import '../ImageSLiders/fan_carsoel.dart';
import '../ImageSLiders/image_slder.dart';
import '../ImageSLiders/CarouselDemo.dart';

class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  String? _filePath;
  Uint8List? _fileBytes;

  Future<void> _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'img'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _filePath = result.files.single.path;
        if (_filePath != null) {
          _fileBytes = File(_filePath!).readAsBytesSync();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single file Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _openFileExplorer,
              child: const Text('Select Image'),
            ),
            const SizedBox(height: 20),
            _filePath != null && _fileBytes != null
                ? Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(_fileBytes!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(),
            SizedBox(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Imagesliderone(
                          title: 'Image slider flex',
                        ),
                      ));
                },
                child: Text("Image slider 1")),
            SizedBox(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Card_slider_page(),
                      ));
                },
                child: Text("Card_slider_page")),
            SizedBox(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarouselDemo(),
                      ));
                },
                child: Text("carousel_slider")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Fan_carousel(),
                      ));
                },
                child: Text("Fan_carousel"))
          ],
        ),
      ),
    );
  }
}
