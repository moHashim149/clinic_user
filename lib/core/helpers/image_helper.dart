import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import '../di/di.dart';

enum PickImageFromEnum { camera, gallery }

@injectable
class DocumentHelper {
  final ImagePicker _imagePicker = getIt<ImagePicker>();

  Future<File> compressFile({required XFile xFile}) async {
    Uint8List? uint8list = await FlutterImageCompress.compressWithFile(
      xFile.path,
      quality: 90,
      minWidth: 800,
      minHeight: 600,
    );
    final tempDir = await getTemporaryDirectory();
    final compressedFilePath = join(
      tempDir.path,
      'compressed_${basename(xFile.path)}',
    );
    File compressedFile = File(compressedFilePath);
    await compressedFile.writeAsBytes(uint8list!);

    return compressedFile;
  }

  Future<File?> pickImage({required PickImageFromEnum type}) async {
    XFile? photo;
    if (type == PickImageFromEnum.camera) {
      photo = await _imagePicker.pickImage(source: ImageSource.camera);
    } else {
      photo = await _imagePicker.pickImage(source: ImageSource.gallery);
    }

    if (photo != null) {
      var pickedImage = await compressFile(xFile: photo);
      return pickedImage;
    } else {
      return null;
    }
  }

  Future<List<File>> pickImages({int? limit}) async {
    final ImagePickerPlatform imagePickerImplementation =
        ImagePickerPlatform.instance;
    if (imagePickerImplementation is ImagePickerAndroid) {
      imagePickerImplementation.useAndroidPhotoPicker = true;
    }
    List<XFile> photos = await _imagePicker.pickMultiImage(limit: limit);
    List<File> pickedImages = [];
    for (var photo in photos) {
      var pickedImage = await compressFile(xFile: photo);
      pickedImages.add(pickedImage);
    }
    return pickedImages;
  }

  Future<File?> pickVideo() async {
    XFile? video = await _imagePicker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      return File(video.path);
    } else {
      return null;
    }
  }

}
