import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class FaceDetectionScreen extends StatefulWidget {
  @override
  _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  File? _imageFile;        // Captured image
  bool _isFaceDetected = false;  // Face detection status
  final ImagePicker _picker = ImagePicker();
  final faceDetector = GoogleMlKit.vision.faceDetector();  // ML Kit Face Detector

  // Method to pick image from camera
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _detectFaces(_imageFile!);  // Detect faces in the captured image
    }
  }

  // Face detection function
  Future<void> _detectFaces(File image) async {
    final inputImage = InputImage.fromFile(image);
    final List<Face> faces = await faceDetector.processImage(inputImage);

    if (faces.isNotEmpty) {
      setState(() {
        _isFaceDetected = true;  // Face(s) detected
      });
    } else {
      setState(() {
        _isFaceDetected = false;  // No faces detected
      });
    }
  }

  // Dummy face matching function (This is where the actual matching logic/API call would go)
  Future<bool> _matchFaceWithProvidedImage() async {
    // In a real scenario, you'd either call an external API or implement your own matching algorithm here
    // For demonstration, we assume the match is successful when a face is detected
    return _isFaceDetected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Detection & Matching'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile != null
                ? Image.file(_imageFile!)  // Display the captured image
                : Text('No image selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,  // On button press, open camera
              child: Text('Capture Image'),
            ),
            SizedBox(height: 20),
            Text(_isFaceDetected ? 'Face Detected!' : 'No Face Detected'),
            ElevatedButton(
              onPressed: () async {
                bool matchResult = await _matchFaceWithProvidedImage();
                if (matchResult) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Face Match Success'),
                    backgroundColor: Colors.green,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Face Match Failed'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Text('Match Face with Provided Image'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    faceDetector.close();  // Don't forget to close the face detector
    super.dispose();
  }
}