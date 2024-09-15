import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DetailController extends ChangeNotifier{
  bool _faceMatch = false;

  double _threshold = 10.0;
 

  Future<XFile?> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    return await _picker.pickImage(
        source: ImageSource.gallery); // or ImageSource.gallery
  }

  Future<InputImage> convertXFileToInputImage(XFile imageFile) async {
    final inputImage = InputImage.fromFilePath(imageFile.path);
    return inputImage;
  }

  Future<List<Face>> detectFacesFromImage(InputImage inputImage) async {
    final faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
      enableLandmarks: true,
    ));
    final List<Face> faces = await faceDetector.processImage(inputImage);
    await faceDetector.close();
    return faces;
  }

  Offset? getLandmarkPosition(Face face, FaceLandmarkType type) {
    // Access the landmark from the landmarks map
    final FaceLandmark? landmark = face.landmarks[type];

    if (landmark != null && landmark.position != null) {
      return Offset(
          landmark.position!.x.toDouble(), landmark.position!.y.toDouble());
    }

    return null; // Return null if the landmark or its position is not found
  }

  double calculateDistance(Offset point1, Offset point2) {
    return sqrt((point1.dx - point2.dx) * (point1.dx - point2.dx) +
        (point1.dy - point2.dy) * (point1.dy - point2.dy));
  }

  bool compareFaces(Face face1, Face face2, double threshold) {
    final leftEye1 = getLandmarkPosition(face1, FaceLandmarkType.leftEye);
    final rightEye1 = getLandmarkPosition(face1, FaceLandmarkType.rightEye);
    final nose1 = getLandmarkPosition(face1, FaceLandmarkType.noseBase);

    final leftEye2 = getLandmarkPosition(face2, FaceLandmarkType.leftEye);
    final rightEye2 = getLandmarkPosition(face2, FaceLandmarkType.rightEye);
    final nose2 = getLandmarkPosition(face2, FaceLandmarkType.noseBase);

    if (leftEye1 == null ||
        rightEye1 == null ||
        nose1 == null ||
        leftEye2 == null ||
        rightEye2 == null ||
        nose2 == null) {
      return false; // Return false if any landmark is not detected
    }

    // Calculate distances between key points
    final eyeDistance1 = calculateDistance(leftEye1, rightEye1);
    final noseEyeDistance1 = calculateDistance(leftEye1, nose1);

    final eyeDistance2 = calculateDistance(leftEye2, rightEye2);
    final noseEyeDistance2 = calculateDistance(leftEye2, nose2);

    // Compare the differences
    final difference = (eyeDistance1 - eyeDistance2).abs() +
        (noseEyeDistance1 - noseEyeDistance2).abs();

    // Return true if difference is within the threshold
    return difference < threshold;
  }

  Future<bool> compareImages(String networkImageUrl) async {
    // 1. Capture an image (camera or gallery)
    final XFile? capturedImage = await pickImage();
    if (capturedImage == null) return false;

    // 2. Convert the captured image to InputImage for processing
    final InputImage capturedInputImage =
        await convertXFileToInputImage(capturedImage);

    // 3. Detect faces in the captured image
    final List<Face> capturedFaces =
        await detectFacesFromImage(capturedInputImage);
    if (capturedFaces.isEmpty) {
      print('No face detected in captured image');
      return false;
    }
    Face capturedFace = capturedFaces.first;

    // 4. Download the network image and convert it to InputImage
    final InputImage networkInputImage =
        await downloadAndConvertNetworkImage(networkImageUrl);

    // 5. Detect faces in the network image
    final List<Face> networkFaces =
        await detectFacesFromImage(networkInputImage);
    if (networkFaces.isEmpty) {
      print('No face detected in network image');
      return false;
    }
    Face networkFace = networkFaces.first;

    // 6. Compare the faces and set the result
    
      _faceMatch = compareFaces(capturedFace, networkFace, _threshold);


    if (_faceMatch) {
      return true;
    } else {return false;
     
    }
    
  }

  Future<InputImage> downloadAndConvertNetworkImage(String url) async {
    final directory = await getTemporaryDirectory();
    final direcPath = directory.path;
    print("Path of Directory $direcPath");
    final http.Response response = await http.get(Uri.parse(url));
    final File networkImageFile = File('$direcPath/network_image.jpg');
    await networkImageFile.writeAsBytes(response.bodyBytes);
    return InputImage.fromFile(networkImageFile);
  }

}