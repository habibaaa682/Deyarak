import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../controllers/sharedPrefrenceController.dart';
import '../../../../../core/utils/api_service.dart';

class UploadImageWidget extends StatefulWidget {
  final ApiService apiService;

  UploadImageWidget(this.apiService);

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState(apiService);
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  XFile? _selectedImage;
  final ApiService apiService;

  _UploadImageWidgetState(this.apiService);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _selectedImage != null
            ? Center(
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(_selectedImage!.path)),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Positioned(
                child: IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: () {
                    _getImage();
                  },
                ),
                bottom: -10,
                left: 65,
              )
            ],
          ),
        )
            : Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/User-avatar.svg.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: () {
                    _getImage();
                  },
                ),
                bottom: -10,
                left: 65,
              )
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_selectedImage != null) {
              _uploadImage(File(_selectedImage!.path));
            } else {
              // Handle case where no image is selected
            }
          },
          child: Text('Upload Image'),
        ),
      ],
    );
  }

  Future<void> _getImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    setState(() {
      _selectedImage = XFile(pickedFile.path);
    });
  }

  Future<void> _uploadImage(File imageFile) async {
    try {
      // Create FormData and add the image file
      FormData formdata = FormData.fromMap({
        'photo': await MultipartFile.fromFile(imageFile.path),
      });

      // Get the token
      String token = GlobalSharedPreferences.getString('token');

      // Perform API request to upload image
      final response = await apiService.patchFormData(
        endPointPath: 'users/updateMe',
        token: token,
        data: formdata,
      );

      // Check the response status code
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile image updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        // Handle navigation or any other action upon successful upload
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to upload profile image'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during image upload: ${e.message}'),
          backgroundColor: Colors.red,
        ),
      );
      print(e);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during image upload: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
