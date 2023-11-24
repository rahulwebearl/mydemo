import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'dart:io';

class MultipleFile extends StatefulWidget {
  @override
  _MultipleFileState createState() => _MultipleFileState();
}

class _MultipleFileState extends State<MultipleFile> {
  List<String> _filePaths = [];
  List<Uint8List> _fileBytesList = [];

  Future<void> _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
        'pdf'
      ], // Specify the allowed file extensions
    );

    if (result != null) {
      for (var file in result.files) {
        String? filePath = file.path;
        if (filePath != null) {
          Uint8List fileBytes = File(filePath).readAsBytesSync();
          setState(() {
            _filePaths.add(filePath);
            _fileBytesList.add(fileBytes);
          });
        }
      }
    }
  }

  Widget _buildFileWidget(int index) {
    String filePath = _filePaths[index];
    Uint8List fileBytes = _fileBytesList[index];

    if (filePath.toLowerCase().endsWith('.jpg') ||
        filePath.toLowerCase().endsWith('.png')) {
      return Column(
        children: [
          Container(
            height: 400,
            width: 500,
            child: SingleChildScrollView(
              child: Image.memory(
                fileBytes,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _filePaths.removeAt(index);
                _fileBytesList.removeAt(index);
              });
            },
            child: const Text('Remove'),
          ),
        ],
      );
    } else {
      return ListTile(
        leading: const Icon(Icons.attach_file),
        title: Text('File ${index + 1}'),
        subtitle: Text(filePath),
        trailing: const Icon(Icons.remove_circle),
        onTap: () {
          setState(() {
            _filePaths.removeAt(index);
            _fileBytesList.removeAt(index);
          });
        },
      );
    }
  }

  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextPage(
          filePaths: _filePaths,
          fileBytesList: _fileBytesList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _openFileExplorer,
              child: const Text('Select Files'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filePaths.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildFileWidget(index),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _navigateToNextPage,
              child: const Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final List<String> filePaths;
  final List<Uint8List> fileBytesList;

  const NextPage({required this.filePaths, required this.fileBytesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: ListView.builder(
        itemCount: filePaths.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildFileWidget(context, index),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFileWidget(BuildContext context, int index) {
    String filePath = filePaths[index];
    Uint8List fileBytes = fileBytesList[index];

    if (filePath.toLowerCase().endsWith('.jpg') ||
        filePath.toLowerCase().endsWith('.png')) {
      return Column(
        children: [
          Container(
            height: 400,
            width: 500,
            child: SingleChildScrollView(
              child: Image.memory(
                fileBytes,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      );
    } else {
      return ListTile(
        leading: const Icon(Icons.attach_file),
        title: Text('File ${index + 1}'),
        subtitle: Text(filePath),
      );
    }
  }
}
